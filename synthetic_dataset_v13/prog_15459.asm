; DESCRIPTION: Composite: Creates a black circular shape at (424, 142) with radius 54 then Renders a white box of size 33x24 starting at (83, 99).
; PLAN: r0=424(x), r1=142(y), r2=54(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=83(x), r6=99(y), r7=33(width), r8=24(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 424
LDI r1, 142
LDI r2, 54
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 83
LDI r6, 99
LDI r7, 33
LDI r8, 24
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
