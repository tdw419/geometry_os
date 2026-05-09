; DESCRIPTION: Composite: Places a orange 104x119 rectangle at position (86, 97) then Creates a orange circular shape at (138, 144) with radius 69 then Draws a green line from (27, 168) to (350, 15).
; PLAN: r0=86(x), r1=97(y), r2=104(width), r3=119(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=138(x), r6=144(y), r7=69(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=27(x1), r11=168(y1), r12=350(x2), r13=15(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 86
LDI r1, 97
LDI r2, 104
LDI r3, 119
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 138
LDI r6, 144
LDI r7, 69
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 27
LDI r11, 168
LDI r12, 350
LDI r13, 15
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
