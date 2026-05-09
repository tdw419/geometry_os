; DESCRIPTION: Composite: Creates a blue circular shape at (379, 121) with radius 79 then Renders a white line between points (236, 190) and (234, 248) then Draws a blue rectangle at (208, 49) with width 71 and height 13.
; PLAN: r0=379(x), r1=121(y), r2=79(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=236(x1), r6=190(y1), r7=234(x2), r8=248(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=208(x), r11=49(y), r12=71(width), r13=13(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 379
LDI r1, 121
LDI r2, 79
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 236
LDI r6, 190
LDI r7, 234
LDI r8, 248
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 208
LDI r11, 49
LDI r12, 71
LDI r13, 13
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
