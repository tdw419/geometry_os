; DESCRIPTION: Renders a blue line between points (14, 78) and (229, 138).
; PLAN: r0=14(x1), r1=78(y1), r2=229(x2), r3=138(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 78
LDI r2, 229
LDI r3, 138
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
