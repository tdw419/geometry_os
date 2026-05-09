; DESCRIPTION: Composite: Places a cyan line segment connecting (488, 3) to (337, 183) then Creates a yellow rectangular region at (332, 44) spanning 40 by 73 pixels then Places a red circle of radius 26 at center (134, 100).
; PLAN: r0=488(x1), r1=3(y1), r2=337(x2), r3=183(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=332(x), r6=44(y), r7=40(width), r8=73(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=134(x), r11=100(y), r12=26(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 488
LDI r1, 3
LDI r2, 337
LDI r3, 183
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 332
LDI r6, 44
LDI r7, 40
LDI r8, 73
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 134
LDI r11, 100
LDI r12, 26
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
