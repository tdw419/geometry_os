; DESCRIPTION: Draws a blue line from (44, 246) to (8, 231).
; PLAN: r0=44(x1), r1=246(y1), r2=8(x2), r3=231(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 246
LDI r2, 8
LDI r3, 231
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
