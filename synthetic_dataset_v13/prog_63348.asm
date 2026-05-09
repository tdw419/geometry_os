; DESCRIPTION: Composite: Draws a green circle centered at (329, 147) with radius 44 then Places a magenta line segment connecting (286, 141) to (52, 199) then Creates a orange rectangular region at (59, 60) spanning 115 by 119 pixels.
; PLAN: r0=329(x), r1=147(y), r2=44(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=286(x1), r6=141(y1), r7=52(x2), r8=199(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=59(x), r11=60(y), r12=115(width), r13=119(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 329
LDI r1, 147
LDI r2, 44
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 286
LDI r6, 141
LDI r7, 52
LDI r8, 199
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 59
LDI r11, 60
LDI r12, 115
LDI r13, 119
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
