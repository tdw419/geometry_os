; DESCRIPTION: Composite: Creates a blue circular shape at (438, 142) with radius 39 then Draws a blue rectangle at (140, 15) with width 90 and height 76.
; PLAN: r0=438(x), r1=142(y), r2=39(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=140(x), r6=15(y), r7=90(width), r8=76(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 438
LDI r1, 142
LDI r2, 39
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 140
LDI r6, 15
LDI r7, 90
LDI r8, 76
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
