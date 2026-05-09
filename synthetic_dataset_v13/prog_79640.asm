; DESCRIPTION: Composite: Places a white 18x80 rectangle at position (438, 2) then Draws a green circle centered at (178, 88) with radius 66.
; PLAN: r0=438(x), r1=2(y), r2=18(width), r3=80(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=178(x), r6=88(y), r7=66(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 438
LDI r1, 2
LDI r2, 18
LDI r3, 80
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 178
LDI r6, 88
LDI r7, 66
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
