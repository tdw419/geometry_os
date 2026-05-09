; DESCRIPTION: Composite: Places a purple dot at position (23, 109) then Renders a red box of size 61x43 starting at (359, 136) then Draws a magenta circle centered at (366, 159) with radius 12.
; PLAN: r0=23(x), r1=109(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=359(x), r6=136(y), r7=61(width), r8=43(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=366(x), r11=159(y), r12=12(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 23
LDI r1, 109
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 359
LDI r6, 136
LDI r7, 61
LDI r8, 43
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 366
LDI r11, 159
LDI r12, 12
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
