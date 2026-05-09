; DESCRIPTION: Composite: Draws a yellow circle centered at (429, 194) with radius 30 then Places a magenta line segment connecting (444, 70) to (203, 8) then Creates a green rectangular region at (130, 80) spanning 43 by 82 pixels.
; PLAN: r0=429(x), r1=194(y), r2=30(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=444(x1), r6=70(y1), r7=203(x2), r8=8(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=130(x), r11=80(y), r12=43(width), r13=82(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 429
LDI r1, 194
LDI r2, 30
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 444
LDI r6, 70
LDI r7, 203
LDI r8, 8
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 130
LDI r11, 80
LDI r12, 43
LDI r13, 82
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
