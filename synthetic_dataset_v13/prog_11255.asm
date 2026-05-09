; DESCRIPTION: Composite: Creates a white circular shape at (385, 116) with radius 29 then Draws a white rectangle at (44, 72) with width 79 and height 110.
; PLAN: r0=385(x), r1=116(y), r2=29(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=44(x), r6=72(y), r7=79(width), r8=110(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 385
LDI r1, 116
LDI r2, 29
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 44
LDI r6, 72
LDI r7, 79
LDI r8, 110
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
