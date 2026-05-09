; DESCRIPTION: Composite: Draws a orange circle centered at (351, 147) with radius 79 then Renders a white box of size 104x87 starting at (179, 104).
; PLAN: r0=351(x), r1=147(y), r2=79(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=179(x), r6=104(y), r7=104(width), r8=87(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 351
LDI r1, 147
LDI r2, 79
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 179
LDI r6, 104
LDI r7, 104
LDI r8, 87
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
