; DESCRIPTION: Composite: Draws a purple circle centered at (366, 77) with radius 64 then Renders a cyan line between points (240, 113) and (158, 134) then Renders a yellow box of size 45x104 starting at (436, 55).
; PLAN: r0=366(x), r1=77(y), r2=64(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=240(x1), r6=113(y1), r7=158(x2), r8=134(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=436(x), r11=55(y), r12=45(width), r13=104(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 366
LDI r1, 77
LDI r2, 64
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 240
LDI r6, 113
LDI r7, 158
LDI r8, 134
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 436
LDI r11, 55
LDI r12, 45
LDI r13, 104
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
