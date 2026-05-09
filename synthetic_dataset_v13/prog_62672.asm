; DESCRIPTION: Composite: Renders a orange box of size 93x97 starting at (163, 149) then Places a green dot at position (108, 113) then Draws a magenta circle centered at (70, 70) with radius 55.
; PLAN: r0=163(x), r1=149(y), r2=93(width), r3=97(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=108(x), r6=113(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=70(x), r11=70(y), r12=55(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 163
LDI r1, 149
LDI r2, 93
LDI r3, 97
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 108
LDI r6, 113
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 70
LDI r11, 70
LDI r12, 55
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
