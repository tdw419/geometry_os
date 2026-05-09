; DESCRIPTION: Composite: Places a green circle of radius 63 at center (404, 96) then Draws a yellow line from (194, 70) to (133, 170) then Creates a magenta rectangular region at (444, 204) spanning 57 by 13 pixels.
; PLAN: r0=404(x), r1=96(y), r2=63(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=194(x1), r6=70(y1), r7=133(x2), r8=170(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=444(x), r11=204(y), r12=57(width), r13=13(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 404
LDI r1, 96
LDI r2, 63
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 194
LDI r6, 70
LDI r7, 133
LDI r8, 170
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 444
LDI r11, 204
LDI r12, 57
LDI r13, 13
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
