; DESCRIPTION: Composite: Draws a magenta circle centered at (301, 141) with radius 60 then Sets a single blue pixel at (120, 226).
; PLAN: r0=301(x), r1=141(y), r2=60(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=120(x), r6=226(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 301
LDI r1, 141
LDI r2, 60
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 120
LDI r6, 226
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
