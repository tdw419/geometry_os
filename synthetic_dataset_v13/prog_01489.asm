; DESCRIPTION: Composite: Draws a blue circle centered at (151, 108) with radius 10 then Sets a single black pixel at (68, 42) then Renders a orange box of size 26x107 starting at (216, 63).
; PLAN: r0=151(x), r1=108(y), r2=10(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=68(x), r6=42(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=216(x), r11=63(y), r12=26(width), r13=107(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 151
LDI r1, 108
LDI r2, 10
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 68
LDI r6, 42
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 216
LDI r11, 63
LDI r12, 26
LDI r13, 107
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
