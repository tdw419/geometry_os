; DESCRIPTION: Composite: Renders a magenta disk with center (261, 177) and radius 69 then Sets a single black pixel at (42, 47).
; PLAN: r0=261(x), r1=177(y), r2=69(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=42(x), r6=47(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 261
LDI r1, 177
LDI r2, 69
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 42
LDI r6, 47
LDI r7, 0x000000
PSET r5, r6, r7
HALT
