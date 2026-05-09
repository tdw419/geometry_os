; DESCRIPTION: Composite: Creates a cyan rectangular region at (378, 157) spanning 86 by 78 pixels then Places a orange line segment connecting (284, 137) to (67, 176) then Draws a green circle centered at (213, 114) with radius 43.
; PLAN: r0=378(x), r1=157(y), r2=86(width), r3=78(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=284(x1), r6=137(y1), r7=67(x2), r8=176(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=213(x), r11=114(y), r12=43(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 378
LDI r1, 157
LDI r2, 86
LDI r3, 78
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 284
LDI r6, 137
LDI r7, 67
LDI r8, 176
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 213
LDI r11, 114
LDI r12, 43
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
