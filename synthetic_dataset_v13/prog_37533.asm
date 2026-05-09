; DESCRIPTION: Renders a blue line between points (328, 15) and (381, 161).
; PLAN: r0=328(x1), r1=15(y1), r2=381(x2), r3=161(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 15
LDI r2, 381
LDI r3, 161
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
