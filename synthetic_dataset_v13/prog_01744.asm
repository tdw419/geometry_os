; DESCRIPTION: Composite: Renders a black line between points (439, 14) and (208, 12) then Draws a white circle centered at (116, 193) with radius 33 then Draws a white rectangle at (170, 192) with width 113 and height 59.
; PLAN: r0=439(x1), r1=14(y1), r2=208(x2), r3=12(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=116(x), r6=193(y), r7=33(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=170(x), r11=192(y), r12=113(width), r13=59(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 439
LDI r1, 14
LDI r2, 208
LDI r3, 12
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 116
LDI r6, 193
LDI r7, 33
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 170
LDI r11, 192
LDI r12, 113
LDI r13, 59
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
