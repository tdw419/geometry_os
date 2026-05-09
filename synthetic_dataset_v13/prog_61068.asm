; DESCRIPTION: Composite: Places a red circle of radius 48 at center (459, 142) then Creates a blue rectangular region at (30, 5) spanning 120 by 85 pixels then Renders a purple line between points (121, 112) and (244, 27).
; PLAN: r0=459(x), r1=142(y), r2=48(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=30(x), r6=5(y), r7=120(width), r8=85(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=121(x1), r11=112(y1), r12=244(x2), r13=27(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 459
LDI r1, 142
LDI r2, 48
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 30
LDI r6, 5
LDI r7, 120
LDI r8, 85
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 121
LDI r11, 112
LDI r12, 244
LDI r13, 27
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
