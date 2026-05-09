; DESCRIPTION: Composite: Sets a single purple pixel at (499, 99) then Draws a yellow rectangle at (33, 114) with width 61 and height 61 then Creates a yellow circular shape at (47, 187) with radius 23.
; PLAN: r0=499(x), r1=99(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=33(x), r6=114(y), r7=61(width), r8=61(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=47(x), r11=187(y), r12=23(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 499
LDI r1, 99
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 33
LDI r6, 114
LDI r7, 61
LDI r8, 61
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 47
LDI r11, 187
LDI r12, 23
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
