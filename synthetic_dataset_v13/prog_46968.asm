; DESCRIPTION: Composite: Renders a black box of size 112x16 starting at (251, 56) then Creates a black circular shape at (253, 180) with radius 73.
; PLAN: r0=251(x), r1=56(y), r2=112(width), r3=16(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=253(x), r6=180(y), r7=73(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 251
LDI r1, 56
LDI r2, 112
LDI r3, 16
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 253
LDI r6, 180
LDI r7, 73
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
