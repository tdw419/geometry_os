; DESCRIPTION: Composite: Places a orange 63x113 rectangle at position (9, 46) then Places a purple dot at position (28, 37) then Draws a red circle centered at (90, 91) with radius 65.
; PLAN: r0=9(x), r1=46(y), r2=63(width), r3=113(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=28(x), r6=37(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=90(x), r11=91(y), r12=65(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 9
LDI r1, 46
LDI r2, 63
LDI r3, 113
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 28
LDI r6, 37
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 90
LDI r11, 91
LDI r12, 65
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
