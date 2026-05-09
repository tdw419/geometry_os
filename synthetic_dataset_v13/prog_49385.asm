; DESCRIPTION: Composite: Draws a yellow line from (432, 106) to (2, 189) then Places a red 14x32 rectangle at position (106, 66) then Draws a red circle centered at (313, 166) with radius 16.
; PLAN: r0=432(x1), r1=106(y1), r2=2(x2), r3=189(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=106(x), r6=66(y), r7=14(width), r8=32(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=313(x), r11=166(y), r12=16(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 432
LDI r1, 106
LDI r2, 2
LDI r3, 189
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 106
LDI r6, 66
LDI r7, 14
LDI r8, 32
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 313
LDI r11, 166
LDI r12, 16
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
