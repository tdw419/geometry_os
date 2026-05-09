; DESCRIPTION: Renders a black line between points (65, 161) and (110, 145).
; PLAN: r0=65(x1), r1=161(y1), r2=110(x2), r3=145(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 161
LDI r2, 110
LDI r3, 145
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
