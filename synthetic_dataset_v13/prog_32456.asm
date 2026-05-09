; DESCRIPTION: Composite: Draws a white rectangle at (416, 203) with width 54 and height 40 then Places a yellow dot at position (179, 172).
; PLAN: r0=416(x), r1=203(y), r2=54(width), r3=40(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=179(x), r6=172(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 416
LDI r1, 203
LDI r2, 54
LDI r3, 40
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 179
LDI r6, 172
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
