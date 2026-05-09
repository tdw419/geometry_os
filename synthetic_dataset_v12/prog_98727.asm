; DESCRIPTION: Renders a yellow line between points (216, 15) and (461, 250).
; PLAN: r0=216(x1), r1=15(y1), r2=461(x2), r3=250(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 15
LDI r2, 461
LDI r3, 250
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
