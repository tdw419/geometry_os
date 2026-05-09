; DESCRIPTION: Composite: Draws a red rectangle at (137, 63) with width 113 and height 120 then Sets a single blue pixel at (270, 153) then Places a orange line segment connecting (329, 217) to (140, 244).
; PLAN: r0=137(x), r1=63(y), r2=113(width), r3=120(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=270(x), r6=153(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=329(x1), r11=217(y1), r12=140(x2), r13=244(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 137
LDI r1, 63
LDI r2, 113
LDI r3, 120
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 270
LDI r6, 153
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 329
LDI r11, 217
LDI r12, 140
LDI r13, 244
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
