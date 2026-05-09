; DESCRIPTION: Composite: Draws a blue circle centered at (404, 91) with radius 65 then Creates a green rectangular region at (108, 139) spanning 67 by 114 pixels then Places a red dot at position (332, 139).
; PLAN: r0=404(x), r1=91(y), r2=65(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=108(x), r6=139(y), r7=67(width), r8=114(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=332(x), r11=139(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 404
LDI r1, 91
LDI r2, 65
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 108
LDI r6, 139
LDI r7, 67
LDI r8, 114
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 332
LDI r11, 139
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
