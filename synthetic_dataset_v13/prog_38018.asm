; DESCRIPTION: Composite: Places a black 34x27 rectangle at position (160, 172) then Draws a blue circle centered at (252, 176) with radius 58 then Places a red line segment connecting (286, 59) to (373, 103).
; PLAN: r0=160(x), r1=172(y), r2=34(width), r3=27(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=252(x), r6=176(y), r7=58(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=286(x1), r11=59(y1), r12=373(x2), r13=103(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 160
LDI r1, 172
LDI r2, 34
LDI r3, 27
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 252
LDI r6, 176
LDI r7, 58
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 286
LDI r11, 59
LDI r12, 373
LDI r13, 103
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
