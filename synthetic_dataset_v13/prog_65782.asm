; DESCRIPTION: Composite: Renders a purple line between points (104, 63) and (18, 236) then Creates a black rectangular region at (102, 81) spanning 23 by 61 pixels then Renders a white disk with center (234, 129) and radius 47.
; PLAN: r0=104(x1), r1=63(y1), r2=18(x2), r3=236(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=102(x), r6=81(y), r7=23(width), r8=61(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=234(x), r11=129(y), r12=47(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 104
LDI r1, 63
LDI r2, 18
LDI r3, 236
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 102
LDI r6, 81
LDI r7, 23
LDI r8, 61
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 234
LDI r11, 129
LDI r12, 47
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
