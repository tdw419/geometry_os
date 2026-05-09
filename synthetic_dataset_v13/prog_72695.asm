; DESCRIPTION: Composite: Draws a magenta circle centered at (45, 192) with radius 44 then Places a green line segment connecting (25, 165) to (380, 145) then Draws a red rectangle at (13, 174) with width 82 and height 26.
; PLAN: r0=45(x), r1=192(y), r2=44(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=25(x1), r6=165(y1), r7=380(x2), r8=145(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=13(x), r11=174(y), r12=82(width), r13=26(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 45
LDI r1, 192
LDI r2, 44
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 25
LDI r6, 165
LDI r7, 380
LDI r8, 145
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 13
LDI r11, 174
LDI r12, 82
LDI r13, 26
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
