; DESCRIPTION: Composite: Renders a black line between points (15, 161) and (435, 52) then Sets a single magenta pixel at (431, 71).
; PLAN: r0=15(x1), r1=161(y1), r2=435(x2), r3=52(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=431(x), r6=71(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 15
LDI r1, 161
LDI r2, 435
LDI r3, 52
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 431
LDI r6, 71
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
