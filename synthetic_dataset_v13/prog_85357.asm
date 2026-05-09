; DESCRIPTION: Composite: Draws a magenta circle centered at (96, 69) with radius 35 then Sets a single black pixel at (81, 65).
; PLAN: r0=96(x), r1=69(y), r2=35(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=81(x), r6=65(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 96
LDI r1, 69
LDI r2, 35
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 81
LDI r6, 65
LDI r7, 0x000000
PSET r5, r6, r7
HALT
