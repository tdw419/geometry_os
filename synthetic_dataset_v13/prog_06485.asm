; DESCRIPTION: Composite: Places a magenta dot at position (89, 39) then Draws a black rectangle at (148, 78) with width 114 and height 30 then Creates a green circular shape at (307, 20) with radius 15.
; PLAN: r0=89(x), r1=39(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=148(x), r6=78(y), r7=114(width), r8=30(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=307(x), r11=20(y), r12=15(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 89
LDI r1, 39
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 148
LDI r6, 78
LDI r7, 114
LDI r8, 30
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 307
LDI r11, 20
LDI r12, 15
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
