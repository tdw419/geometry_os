; DESCRIPTION: Composite: Renders a blue line between points (25, 25) and (277, 76) then Creates a white rectangular region at (413, 111) spanning 97 by 111 pixels then Creates a yellow circular shape at (151, 91) with radius 56.
; PLAN: r0=25(x1), r1=25(y1), r2=277(x2), r3=76(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=413(x), r6=111(y), r7=97(width), r8=111(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=151(x), r11=91(y), r12=56(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 25
LDI r1, 25
LDI r2, 277
LDI r3, 76
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 413
LDI r6, 111
LDI r7, 97
LDI r8, 111
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 151
LDI r11, 91
LDI r12, 56
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
