; DESCRIPTION: Composite: Places a green 39x67 rectangle at position (435, 23) then Places a blue dot at position (302, 3) then Draws a orange circle centered at (345, 146) with radius 74.
; PLAN: r0=435(x), r1=23(y), r2=39(width), r3=67(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=302(x), r6=3(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=345(x), r11=146(y), r12=74(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 435
LDI r1, 23
LDI r2, 39
LDI r3, 67
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 302
LDI r6, 3
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 345
LDI r11, 146
LDI r12, 74
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
