; DESCRIPTION: Composite: Renders a magenta disk with center (267, 169) and radius 47 then Places a purple dot at position (376, 218).
; PLAN: r0=267(x), r1=169(y), r2=47(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=376(x), r6=218(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 267
LDI r1, 169
LDI r2, 47
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 376
LDI r6, 218
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
