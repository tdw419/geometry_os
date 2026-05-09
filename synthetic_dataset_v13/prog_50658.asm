; DESCRIPTION: Draws a purple line from (32, 163) to (296, 231).
; PLAN: r0=32(x1), r1=163(y1), r2=296(x2), r3=231(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 163
LDI r2, 296
LDI r3, 231
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
