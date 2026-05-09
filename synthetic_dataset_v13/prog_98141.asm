; DESCRIPTION: Composite: Sets a single red pixel at (507, 153) then Draws a purple circle centered at (78, 164) with radius 20.
; PLAN: r0=507(x), r1=153(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=78(x), r6=164(y), r7=20(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 507
LDI r1, 153
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 78
LDI r6, 164
LDI r7, 20
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
