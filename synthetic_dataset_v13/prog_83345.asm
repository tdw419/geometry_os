; DESCRIPTION: Composite: Creates a magenta rectangular region at (378, 89) spanning 14 by 67 pixels then Renders a yellow disk with center (386, 97) and radius 61 then Renders a yellow line between points (503, 115) and (269, 58).
; PLAN: r0=378(x), r1=89(y), r2=14(width), r3=67(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=386(x), r6=97(y), r7=61(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=503(x1), r11=115(y1), r12=269(x2), r13=58(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 378
LDI r1, 89
LDI r2, 14
LDI r3, 67
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 386
LDI r6, 97
LDI r7, 61
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 503
LDI r11, 115
LDI r12, 269
LDI r13, 58
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
