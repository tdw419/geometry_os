; DESCRIPTION: Composite: Draws a black line from (284, 108) to (430, 172) then Renders a white disk with center (217, 80) and radius 27 then Creates a red rectangular region at (143, 64) spanning 76 by 89 pixels.
; PLAN: r0=284(x1), r1=108(y1), r2=430(x2), r3=172(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=217(x), r6=80(y), r7=27(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=143(x), r11=64(y), r12=76(width), r13=89(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 284
LDI r1, 108
LDI r2, 430
LDI r3, 172
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 217
LDI r6, 80
LDI r7, 27
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 143
LDI r11, 64
LDI r12, 76
LDI r13, 89
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
