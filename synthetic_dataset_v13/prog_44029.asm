; DESCRIPTION: Draws a purple line from (508, 189) to (296, 48).
; PLAN: r0=508(x1), r1=189(y1), r2=296(x2), r3=48(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 508
LDI r1, 189
LDI r2, 296
LDI r3, 48
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
