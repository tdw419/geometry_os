; DESCRIPTION: Composite: Places a black circle of radius 78 at center (100, 114) then Draws a purple line from (461, 182) to (35, 114) then Creates a cyan rectangular region at (34, 74) spanning 106 by 64 pixels.
; PLAN: r0=100(x), r1=114(y), r2=78(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=461(x1), r6=182(y1), r7=35(x2), r8=114(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=34(x), r11=74(y), r12=106(width), r13=64(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 100
LDI r1, 114
LDI r2, 78
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 461
LDI r6, 182
LDI r7, 35
LDI r8, 114
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 34
LDI r11, 74
LDI r12, 106
LDI r13, 64
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
