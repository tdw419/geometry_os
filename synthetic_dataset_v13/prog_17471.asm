; DESCRIPTION: Renders a black line between points (183, 211) and (470, 145).
; PLAN: r0=183(x1), r1=211(y1), r2=470(x2), r3=145(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 211
LDI r2, 470
LDI r3, 145
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
