; DESCRIPTION: Composite: Places a white line segment connecting (369, 149) to (57, 88) then Places a cyan circle of radius 45 at center (119, 70) then Draws a red rectangle at (195, 73) with width 27 and height 77.
; PLAN: r0=369(x1), r1=149(y1), r2=57(x2), r3=88(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=119(x), r6=70(y), r7=45(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=195(x), r11=73(y), r12=27(width), r13=77(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 369
LDI r1, 149
LDI r2, 57
LDI r3, 88
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 119
LDI r6, 70
LDI r7, 45
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 195
LDI r11, 73
LDI r12, 27
LDI r13, 77
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
