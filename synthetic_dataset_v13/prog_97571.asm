; DESCRIPTION: Composite: Sets a single magenta pixel at (35, 28) then Renders a magenta disk with center (467, 154) and radius 24.
; PLAN: r0=35(x), r1=28(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=467(x), r6=154(y), r7=24(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 35
LDI r1, 28
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 467
LDI r6, 154
LDI r7, 24
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
