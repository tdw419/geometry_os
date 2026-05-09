; DESCRIPTION: Composite: Draws a green circle centered at (42, 146) with radius 33 then Sets a single blue pixel at (375, 59).
; PLAN: r0=42(x), r1=146(y), r2=33(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=375(x), r6=59(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 42
LDI r1, 146
LDI r2, 33
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 375
LDI r6, 59
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
