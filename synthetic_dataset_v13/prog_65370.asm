; DESCRIPTION: Composite: Draws a yellow circle centered at (318, 78) with radius 29 then Draws a magenta line from (502, 123) to (421, 203) then Places a white 59x109 rectangle at position (133, 1).
; PLAN: r0=318(x), r1=78(y), r2=29(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=502(x1), r6=123(y1), r7=421(x2), r8=203(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=133(x), r11=1(y), r12=59(width), r13=109(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 318
LDI r1, 78
LDI r2, 29
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 502
LDI r6, 123
LDI r7, 421
LDI r8, 203
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 133
LDI r11, 1
LDI r12, 59
LDI r13, 109
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
