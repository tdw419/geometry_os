; DESCRIPTION: Composite: Draws a blue circle centered at (61, 53) with radius 34 then Places a green line segment connecting (227, 86) to (154, 196) then Places a magenta 107x106 rectangle at position (42, 147).
; PLAN: r0=61(x), r1=53(y), r2=34(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=227(x1), r6=86(y1), r7=154(x2), r8=196(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=42(x), r11=147(y), r12=107(width), r13=106(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 61
LDI r1, 53
LDI r2, 34
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 227
LDI r6, 86
LDI r7, 154
LDI r8, 196
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 42
LDI r11, 147
LDI r12, 107
LDI r13, 106
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
