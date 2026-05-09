; DESCRIPTION: Composite: Places a red 44x91 rectangle at position (329, 7) then Draws a orange circle centered at (95, 120) with radius 60 then Draws a yellow line from (191, 255) to (409, 147).
; PLAN: r0=329(x), r1=7(y), r2=44(width), r3=91(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=95(x), r6=120(y), r7=60(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=191(x1), r11=255(y1), r12=409(x2), r13=147(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 329
LDI r1, 7
LDI r2, 44
LDI r3, 91
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 95
LDI r6, 120
LDI r7, 60
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 191
LDI r11, 255
LDI r12, 409
LDI r13, 147
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
