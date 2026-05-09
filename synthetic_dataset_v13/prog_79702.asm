; DESCRIPTION: Composite: Renders a blue box of size 67x106 starting at (325, 21) then Places a orange dot at position (404, 120) then Draws a magenta circle centered at (115, 139) with radius 79.
; PLAN: r0=325(x), r1=21(y), r2=67(width), r3=106(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=404(x), r6=120(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=115(x), r11=139(y), r12=79(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 325
LDI r1, 21
LDI r2, 67
LDI r3, 106
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 404
LDI r6, 120
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 115
LDI r11, 139
LDI r12, 79
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
