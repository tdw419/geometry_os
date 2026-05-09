; DESCRIPTION: Composite: Places a blue line segment connecting (414, 165) to (23, 63) then Places a blue 26x61 rectangle at position (75, 161) then Draws a red circle centered at (170, 46) with radius 16.
; PLAN: r0=414(x1), r1=165(y1), r2=23(x2), r3=63(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=75(x), r6=161(y), r7=26(width), r8=61(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=170(x), r11=46(y), r12=16(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 414
LDI r1, 165
LDI r2, 23
LDI r3, 63
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 75
LDI r6, 161
LDI r7, 26
LDI r8, 61
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 170
LDI r11, 46
LDI r12, 16
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
