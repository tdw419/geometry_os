; DESCRIPTION: Composite: Creates a magenta rectangular region at (182, 112) spanning 78 by 65 pixels then Creates a yellow circular shape at (308, 190) with radius 49 then Renders a magenta line between points (67, 23) and (484, 247).
; PLAN: r0=182(x), r1=112(y), r2=78(width), r3=65(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=308(x), r6=190(y), r7=49(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=67(x1), r11=23(y1), r12=484(x2), r13=247(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 182
LDI r1, 112
LDI r2, 78
LDI r3, 65
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 308
LDI r6, 190
LDI r7, 49
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 67
LDI r11, 23
LDI r12, 484
LDI r13, 247
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
