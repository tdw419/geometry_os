; DESCRIPTION: Composite: Draws a purple circle centered at (129, 216) with radius 22 then Sets a single orange pixel at (164, 146).
; PLAN: r0=129(x), r1=216(y), r2=22(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=164(x), r6=146(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 129
LDI r1, 216
LDI r2, 22
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 164
LDI r6, 146
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
