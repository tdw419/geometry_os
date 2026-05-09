; DESCRIPTION: Renders a blue line between points (248, 50) and (432, 7).
; PLAN: r0=248(x1), r1=50(y1), r2=432(x2), r3=7(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 50
LDI r2, 432
LDI r3, 7
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
