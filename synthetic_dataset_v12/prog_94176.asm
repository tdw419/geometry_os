; DESCRIPTION: Composite: Creates a magenta rectangular region at (345, 16) spanning 37 by 90 pixels then Places a yellow dot at position (180, 88) then Draws a purple circle centered at (97, 180) with radius 50.
; PLAN: r0=345(x), r1=16(y), r2=37(width), r3=90(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=180(x), r6=88(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=97(x), r11=180(y), r12=50(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 345
LDI r1, 16
LDI r2, 37
LDI r3, 90
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 180
LDI r6, 88
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 97
LDI r11, 180
LDI r12, 50
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
