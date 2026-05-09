; DESCRIPTION: Composite: Sets a single red pixel at (215, 234) then Creates a blue circular shape at (435, 153) with radius 67.
; PLAN: r0=215(x), r1=234(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=435(x), r6=153(y), r7=67(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 215
LDI r1, 234
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 435
LDI r6, 153
LDI r7, 67
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
