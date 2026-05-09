; DESCRIPTION: Composite: Sets a single green pixel at (337, 8) then Renders a blue box of size 97x27 starting at (1, 226) then Draws a black circle centered at (389, 69) with radius 67.
; PLAN: r0=337(x), r1=8(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=1(x), r6=226(y), r7=97(width), r8=27(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=389(x), r11=69(y), r12=67(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 337
LDI r1, 8
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 1
LDI r6, 226
LDI r7, 97
LDI r8, 27
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 389
LDI r11, 69
LDI r12, 67
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
