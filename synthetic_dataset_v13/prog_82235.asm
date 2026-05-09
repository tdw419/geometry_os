; DESCRIPTION: Composite: Renders a magenta box of size 52x33 starting at (2, 11) then Places a red line segment connecting (218, 62) to (218, 162) then Draws a orange circle centered at (54, 61) with radius 33.
; PLAN: r0=2(x), r1=11(y), r2=52(width), r3=33(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=218(x1), r6=62(y1), r7=218(x2), r8=162(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=54(x), r11=61(y), r12=33(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 2
LDI r1, 11
LDI r2, 52
LDI r3, 33
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 218
LDI r6, 62
LDI r7, 218
LDI r8, 162
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 54
LDI r11, 61
LDI r12, 33
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
