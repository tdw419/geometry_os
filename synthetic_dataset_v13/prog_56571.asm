; DESCRIPTION: Composite: Renders a magenta line between points (28, 134) and (456, 219) then Sets a single magenta pixel at (442, 99).
; PLAN: r0=28(x1), r1=134(y1), r2=456(x2), r3=219(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=442(x), r6=99(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 28
LDI r1, 134
LDI r2, 456
LDI r3, 219
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 442
LDI r6, 99
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
