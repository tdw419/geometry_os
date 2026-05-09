; DESCRIPTION: Composite: Renders a white box of size 73x107 starting at (112, 100) then Creates a red circular shape at (314, 139) with radius 48.
; PLAN: r0=112(x), r1=100(y), r2=73(width), r3=107(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=314(x), r6=139(y), r7=48(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 112
LDI r1, 100
LDI r2, 73
LDI r3, 107
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 314
LDI r6, 139
LDI r7, 48
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
