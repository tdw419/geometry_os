; DESCRIPTION: Composite: Places a cyan line segment connecting (234, 203) to (477, 249) then Renders a red disk with center (418, 115) and radius 45 then Creates a white rectangular region at (25, 172) spanning 58 by 70 pixels.
; PLAN: r0=234(x1), r1=203(y1), r2=477(x2), r3=249(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=418(x), r6=115(y), r7=45(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=25(x), r11=172(y), r12=58(width), r13=70(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 234
LDI r1, 203
LDI r2, 477
LDI r3, 249
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 418
LDI r6, 115
LDI r7, 45
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 25
LDI r11, 172
LDI r12, 58
LDI r13, 70
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
