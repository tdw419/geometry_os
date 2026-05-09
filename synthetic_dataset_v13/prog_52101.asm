; DESCRIPTION: Composite: Sets a single purple pixel at (69, 254) then Renders a magenta disk with center (414, 121) and radius 70.
; PLAN: r0=69(x), r1=254(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=414(x), r6=121(y), r7=70(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 69
LDI r1, 254
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 414
LDI r6, 121
LDI r7, 70
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
