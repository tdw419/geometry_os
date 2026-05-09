; DESCRIPTION: Composite: Renders a white box of size 100x44 starting at (242, 200) then Creates a yellow circular shape at (199, 58) with radius 57.
; PLAN: r0=242(x), r1=200(y), r2=100(width), r3=44(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=199(x), r6=58(y), r7=57(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 242
LDI r1, 200
LDI r2, 100
LDI r3, 44
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 199
LDI r6, 58
LDI r7, 57
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
