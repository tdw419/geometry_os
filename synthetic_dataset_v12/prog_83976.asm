; DESCRIPTION: Composite: Sets a single purple pixel at (369, 57) then Creates a blue circular shape at (279, 69) with radius 67.
; PLAN: r0=369(x), r1=57(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=279(x), r6=69(y), r7=67(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 369
LDI r1, 57
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 279
LDI r6, 69
LDI r7, 67
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
