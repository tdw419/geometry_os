; DESCRIPTION: Composite: Places a red circle of radius 79 at center (127, 167) then Places a orange 56x78 rectangle at position (304, 158) then Renders a red line between points (148, 124) and (283, 252).
; PLAN: r0=127(x), r1=167(y), r2=79(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=304(x), r6=158(y), r7=56(width), r8=78(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=148(x1), r11=124(y1), r12=283(x2), r13=252(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 127
LDI r1, 167
LDI r2, 79
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 304
LDI r6, 158
LDI r7, 56
LDI r8, 78
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 148
LDI r11, 124
LDI r12, 283
LDI r13, 252
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
