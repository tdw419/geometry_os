; DESCRIPTION: Composite: Places a purple circle of radius 15 at center (259, 64) then Draws a white rectangle at (178, 177) with width 107 and height 17.
; PLAN: r0=259(x), r1=64(y), r2=15(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=178(x), r6=177(y), r7=107(width), r8=17(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 259
LDI r1, 64
LDI r2, 15
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 178
LDI r6, 177
LDI r7, 107
LDI r8, 17
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
