; DESCRIPTION: Composite: Creates a yellow circular shape at (134, 137) with radius 80 then Creates a yellow rectangular region at (235, 24) spanning 33 by 31 pixels.
; PLAN: r0=134(x), r1=137(y), r2=80(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=235(x), r6=24(y), r7=33(width), r8=31(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 134
LDI r1, 137
LDI r2, 80
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 235
LDI r6, 24
LDI r7, 33
LDI r8, 31
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
