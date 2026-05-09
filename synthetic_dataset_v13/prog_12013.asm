; DESCRIPTION: Composite: Draws a orange circle centered at (271, 177) with radius 20 then Creates a orange rectangular region at (350, 204) spanning 54 by 24 pixels then Draws a red line from (151, 8) to (449, 68).
; PLAN: r0=271(x), r1=177(y), r2=20(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=350(x), r6=204(y), r7=54(width), r8=24(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=151(x1), r11=8(y1), r12=449(x2), r13=68(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 271
LDI r1, 177
LDI r2, 20
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 350
LDI r6, 204
LDI r7, 54
LDI r8, 24
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 151
LDI r11, 8
LDI r12, 449
LDI r13, 68
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
