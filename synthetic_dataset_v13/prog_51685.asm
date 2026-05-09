; DESCRIPTION: Composite: Creates a white rectangular region at (126, 79) spanning 115 by 55 pixels then Draws a green circle centered at (430, 174) with radius 44 then Renders a cyan line between points (230, 131) and (26, 48).
; PLAN: r0=126(x), r1=79(y), r2=115(width), r3=55(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=430(x), r6=174(y), r7=44(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=230(x1), r11=131(y1), r12=26(x2), r13=48(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 126
LDI r1, 79
LDI r2, 115
LDI r3, 55
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 430
LDI r6, 174
LDI r7, 44
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 230
LDI r11, 131
LDI r12, 26
LDI r13, 48
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
