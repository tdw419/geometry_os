; DESCRIPTION: Composite: Renders a yellow line between points (416, 22) and (15, 190) then Places a red circle of radius 74 at center (96, 121) then Creates a cyan rectangular region at (55, 106) spanning 106 by 103 pixels.
; PLAN: r0=416(x1), r1=22(y1), r2=15(x2), r3=190(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=96(x), r6=121(y), r7=74(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=55(x), r11=106(y), r12=106(width), r13=103(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 416
LDI r1, 22
LDI r2, 15
LDI r3, 190
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 96
LDI r6, 121
LDI r7, 74
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 55
LDI r11, 106
LDI r12, 106
LDI r13, 103
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
