; DESCRIPTION: Composite: Draws a yellow rectangle at (406, 60) with width 101 and height 13 then Renders a orange line between points (115, 192) and (396, 201) then Places a black dot at position (329, 59).
; PLAN: r0=406(x), r1=60(y), r2=101(width), r3=13(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=115(x1), r6=192(y1), r7=396(x2), r8=201(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=329(x), r11=59(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 406
LDI r1, 60
LDI r2, 101
LDI r3, 13
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 115
LDI r6, 192
LDI r7, 396
LDI r8, 201
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 329
LDI r11, 59
LDI r12, 0x000000
PSET r10, r11, r12
HALT
