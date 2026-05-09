; DESCRIPTION: Composite: Draws a yellow circle centered at (347, 218) with radius 27 then Renders a orange line between points (225, 153) and (482, 85) then Renders a orange box of size 57x60 starting at (241, 183).
; PLAN: r0=347(x), r1=218(y), r2=27(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=225(x1), r6=153(y1), r7=482(x2), r8=85(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=241(x), r11=183(y), r12=57(width), r13=60(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 347
LDI r1, 218
LDI r2, 27
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 225
LDI r6, 153
LDI r7, 482
LDI r8, 85
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 241
LDI r11, 183
LDI r12, 57
LDI r13, 60
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
