; DESCRIPTION: Composite: Creates a green circular shape at (444, 202) with radius 50 then Creates a yellow rectangular region at (447, 90) spanning 21 by 88 pixels.
; PLAN: r0=444(x), r1=202(y), r2=50(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=447(x), r6=90(y), r7=21(width), r8=88(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 444
LDI r1, 202
LDI r2, 50
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 447
LDI r6, 90
LDI r7, 21
LDI r8, 88
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
