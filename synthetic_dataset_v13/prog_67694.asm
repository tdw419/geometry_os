; DESCRIPTION: Composite: Sets a single purple pixel at (103, 252) then Creates a yellow circular shape at (210, 153) with radius 36.
; PLAN: r0=103(x), r1=252(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=210(x), r6=153(y), r7=36(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 103
LDI r1, 252
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 210
LDI r6, 153
LDI r7, 36
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
