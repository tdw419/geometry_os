; DESCRIPTION: Composite: Places a white 34x53 rectangle at position (116, 117) then Draws a blue circle centered at (378, 119) with radius 79.
; PLAN: r0=116(x), r1=117(y), r2=34(width), r3=53(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=378(x), r6=119(y), r7=79(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 116
LDI r1, 117
LDI r2, 34
LDI r3, 53
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 378
LDI r6, 119
LDI r7, 79
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
