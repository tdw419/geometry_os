; DESCRIPTION: Composite: Renders a white disk with center (41, 109) and radius 36 then Renders a white line between points (336, 20) and (236, 125) then Creates a cyan rectangular region at (336, 43) spanning 115 by 100 pixels.
; PLAN: r0=41(x), r1=109(y), r2=36(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=336(x1), r6=20(y1), r7=236(x2), r8=125(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=336(x), r11=43(y), r12=115(width), r13=100(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 41
LDI r1, 109
LDI r2, 36
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 336
LDI r6, 20
LDI r7, 236
LDI r8, 125
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 336
LDI r11, 43
LDI r12, 115
LDI r13, 100
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
