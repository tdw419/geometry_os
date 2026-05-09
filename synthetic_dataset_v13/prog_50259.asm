; DESCRIPTION: Composite: Creates a blue circular shape at (213, 217) with radius 33 then Draws a cyan rectangle at (378, 97) with width 38 and height 17.
; PLAN: r0=213(x), r1=217(y), r2=33(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=378(x), r6=97(y), r7=38(width), r8=17(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 213
LDI r1, 217
LDI r2, 33
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 378
LDI r6, 97
LDI r7, 38
LDI r8, 17
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
