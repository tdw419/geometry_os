; DESCRIPTION: Composite: Places a orange circle of radius 43 at center (463, 102) then Places a green line segment connecting (272, 60) to (290, 97) then Places a yellow 14x113 rectangle at position (282, 16).
; PLAN: r0=463(x), r1=102(y), r2=43(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=272(x1), r6=60(y1), r7=290(x2), r8=97(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=282(x), r11=16(y), r12=14(width), r13=113(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 463
LDI r1, 102
LDI r2, 43
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 272
LDI r6, 60
LDI r7, 290
LDI r8, 97
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 282
LDI r11, 16
LDI r12, 14
LDI r13, 113
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
