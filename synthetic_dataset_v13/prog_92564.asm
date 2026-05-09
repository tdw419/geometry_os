; DESCRIPTION: Renders a yellow line between points (343, 134) and (224, 105).
; PLAN: r0=343(x1), r1=134(y1), r2=224(x2), r3=105(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 343
LDI r1, 134
LDI r2, 224
LDI r3, 105
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
