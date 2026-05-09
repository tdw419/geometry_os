; DESCRIPTION: Composite: Creates a white rectangular region at (76, 115) spanning 55 by 49 pixels then Renders a black disk with center (252, 134) and radius 24 then Renders a cyan line between points (424, 250) and (187, 141).
; PLAN: r0=76(x), r1=115(y), r2=55(width), r3=49(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=252(x), r6=134(y), r7=24(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=424(x1), r11=250(y1), r12=187(x2), r13=141(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 76
LDI r1, 115
LDI r2, 55
LDI r3, 49
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 252
LDI r6, 134
LDI r7, 24
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 424
LDI r11, 250
LDI r12, 187
LDI r13, 141
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
