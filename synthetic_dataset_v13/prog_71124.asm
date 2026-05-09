; DESCRIPTION: Composite: Renders a white disk with center (336, 136) and radius 76 then Draws a red line from (221, 29) to (319, 41) then Creates a magenta rectangular region at (229, 31) spanning 80 by 60 pixels.
; PLAN: r0=336(x), r1=136(y), r2=76(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=221(x1), r6=29(y1), r7=319(x2), r8=41(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=229(x), r11=31(y), r12=80(width), r13=60(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 336
LDI r1, 136
LDI r2, 76
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 221
LDI r6, 29
LDI r7, 319
LDI r8, 41
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 229
LDI r11, 31
LDI r12, 80
LDI r13, 60
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
