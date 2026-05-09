; DESCRIPTION: Composite: Renders a red line between points (194, 81) and (142, 109) then Renders a black box of size 58x76 starting at (120, 103) then Creates a white circular shape at (170, 175) with radius 27.
; PLAN: r0=194(x1), r1=81(y1), r2=142(x2), r3=109(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=120(x), r6=103(y), r7=58(width), r8=76(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=170(x), r11=175(y), r12=27(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 194
LDI r1, 81
LDI r2, 142
LDI r3, 109
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 120
LDI r6, 103
LDI r7, 58
LDI r8, 76
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 170
LDI r11, 175
LDI r12, 27
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
