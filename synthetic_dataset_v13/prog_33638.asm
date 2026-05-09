; DESCRIPTION: Composite: Creates a magenta circular shape at (78, 56) with radius 29 then Sets a single purple pixel at (350, 243).
; PLAN: r0=78(x), r1=56(y), r2=29(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=350(x), r6=243(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 78
LDI r1, 56
LDI r2, 29
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 350
LDI r6, 243
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
