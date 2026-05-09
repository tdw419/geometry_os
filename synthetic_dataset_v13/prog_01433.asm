; DESCRIPTION: Composite: Creates a orange rectangular region at (95, 184) spanning 74 by 56 pixels then Places a green line segment connecting (460, 149) to (249, 135) then Places a red circle of radius 38 at center (58, 92).
; PLAN: r0=95(x), r1=184(y), r2=74(width), r3=56(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=460(x1), r6=149(y1), r7=249(x2), r8=135(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=58(x), r11=92(y), r12=38(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 95
LDI r1, 184
LDI r2, 74
LDI r3, 56
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 460
LDI r6, 149
LDI r7, 249
LDI r8, 135
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 58
LDI r11, 92
LDI r12, 38
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
