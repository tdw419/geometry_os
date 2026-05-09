; DESCRIPTION: Composite: Draws a red circle centered at (368, 85) with radius 25 then Draws a green line from (510, 133) to (6, 189) then Creates a magenta rectangular region at (178, 56) spanning 80 by 54 pixels.
; PLAN: r0=368(x), r1=85(y), r2=25(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=510(x1), r6=133(y1), r7=6(x2), r8=189(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=178(x), r11=56(y), r12=80(width), r13=54(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 368
LDI r1, 85
LDI r2, 25
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 510
LDI r6, 133
LDI r7, 6
LDI r8, 189
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 178
LDI r11, 56
LDI r12, 80
LDI r13, 54
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
