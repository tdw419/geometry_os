; DESCRIPTION: Renders a blue line between points (11, 9) and (427, 243).
; PLAN: r0=11(x1), r1=9(y1), r2=427(x2), r3=243(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 9
LDI r2, 427
LDI r3, 243
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
