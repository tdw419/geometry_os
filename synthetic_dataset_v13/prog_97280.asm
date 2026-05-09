; DESCRIPTION: Composite: Creates a magenta rectangular region at (153, 70) spanning 51 by 76 pixels then Renders a red disk with center (206, 173) and radius 80 then Renders a purple line between points (119, 221) and (402, 86).
; PLAN: r0=153(x), r1=70(y), r2=51(width), r3=76(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=206(x), r6=173(y), r7=80(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=119(x1), r11=221(y1), r12=402(x2), r13=86(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 153
LDI r1, 70
LDI r2, 51
LDI r3, 76
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 206
LDI r6, 173
LDI r7, 80
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 119
LDI r11, 221
LDI r12, 402
LDI r13, 86
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
