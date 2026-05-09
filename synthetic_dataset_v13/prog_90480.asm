; DESCRIPTION: Composite: Sets a single magenta pixel at (312, 242) then Creates a blue circular shape at (82, 154) with radius 67.
; PLAN: r0=312(x), r1=242(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=82(x), r6=154(y), r7=67(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 312
LDI r1, 242
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 82
LDI r6, 154
LDI r7, 67
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
