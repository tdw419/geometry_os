; DESCRIPTION: Composite: Renders a black line between points (336, 246) and (48, 189) then Creates a black circular shape at (77, 235) with radius 13 then Creates a red rectangular region at (477, 70) spanning 10 by 58 pixels.
; PLAN: r0=336(x1), r1=246(y1), r2=48(x2), r3=189(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=77(x), r6=235(y), r7=13(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=477(x), r11=70(y), r12=10(width), r13=58(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 336
LDI r1, 246
LDI r2, 48
LDI r3, 189
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 77
LDI r6, 235
LDI r7, 13
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 477
LDI r11, 70
LDI r12, 10
LDI r13, 58
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
