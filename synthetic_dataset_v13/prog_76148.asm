; DESCRIPTION: Composite: Draws a green rectangle at (152, 107) with width 67 and height 77 then Renders a black disk with center (153, 114) and radius 43.
; PLAN: r0=152(x), r1=107(y), r2=67(width), r3=77(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=153(x), r6=114(y), r7=43(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 152
LDI r1, 107
LDI r2, 67
LDI r3, 77
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 153
LDI r6, 114
LDI r7, 43
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
