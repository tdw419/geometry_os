; DESCRIPTION: Composite: Draws a black circle centered at (80, 13) with radius 13 then Renders a white box of size 112x83 starting at (347, 166).
; PLAN: r0=80(x), r1=13(y), r2=13(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=347(x), r6=166(y), r7=112(width), r8=83(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 80
LDI r1, 13
LDI r2, 13
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 347
LDI r6, 166
LDI r7, 112
LDI r8, 83
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
