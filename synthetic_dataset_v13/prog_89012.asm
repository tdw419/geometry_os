; DESCRIPTION: Composite: Renders a yellow line between points (494, 17) and (215, 173) then Creates a orange rectangular region at (403, 10) spanning 104 by 91 pixels then Renders a red disk with center (297, 86) and radius 49.
; PLAN: r0=494(x1), r1=17(y1), r2=215(x2), r3=173(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=403(x), r6=10(y), r7=104(width), r8=91(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=297(x), r11=86(y), r12=49(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 494
LDI r1, 17
LDI r2, 215
LDI r3, 173
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 403
LDI r6, 10
LDI r7, 104
LDI r8, 91
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 297
LDI r11, 86
LDI r12, 49
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
