; DESCRIPTION: Composite: Draws a purple circle centered at (242, 114) with radius 62 then Sets a single magenta pixel at (291, 144).
; PLAN: r0=242(x), r1=114(y), r2=62(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=291(x), r6=144(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 242
LDI r1, 114
LDI r2, 62
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 291
LDI r6, 144
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
