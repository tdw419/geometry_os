; DESCRIPTION: Composite: Renders a purple disk with center (152, 175) and radius 22 then Sets a single magenta pixel at (272, 85).
; PLAN: r0=152(x), r1=175(y), r2=22(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=272(x), r6=85(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 152
LDI r1, 175
LDI r2, 22
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 272
LDI r6, 85
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
