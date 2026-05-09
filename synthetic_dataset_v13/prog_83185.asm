; DESCRIPTION: Composite: Draws a yellow circle centered at (109, 54) with radius 52 then Renders a purple line between points (157, 54) and (49, 59) then Creates a purple rectangular region at (103, 103) spanning 57 by 83 pixels.
; PLAN: r0=109(x), r1=54(y), r2=52(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=157(x1), r6=54(y1), r7=49(x2), r8=59(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=103(x), r11=103(y), r12=57(width), r13=83(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 109
LDI r1, 54
LDI r2, 52
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 157
LDI r6, 54
LDI r7, 49
LDI r8, 59
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 103
LDI r11, 103
LDI r12, 57
LDI r13, 83
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
