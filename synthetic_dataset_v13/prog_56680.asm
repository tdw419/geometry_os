; DESCRIPTION: Renders a green line between points (78, 172) and (470, 145).
; PLAN: r0=78(x1), r1=172(y1), r2=470(x2), r3=145(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 172
LDI r2, 470
LDI r3, 145
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
