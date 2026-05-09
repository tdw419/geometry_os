; DESCRIPTION: Composite: Creates a green rectangular region at (469, 129) spanning 33 by 104 pixels then Renders a black disk with center (342, 159) and radius 43.
; PLAN: r0=469(x), r1=129(y), r2=33(width), r3=104(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=342(x), r6=159(y), r7=43(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 469
LDI r1, 129
LDI r2, 33
LDI r3, 104
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 342
LDI r6, 159
LDI r7, 43
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
