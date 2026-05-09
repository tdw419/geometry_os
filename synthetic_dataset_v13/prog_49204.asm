; DESCRIPTION: Composite: Places a yellow line segment connecting (158, 179) to (190, 198) then Places a white circle of radius 34 at center (397, 79) then Creates a black rectangular region at (465, 35) spanning 32 by 44 pixels.
; PLAN: r0=158(x1), r1=179(y1), r2=190(x2), r3=198(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=397(x), r6=79(y), r7=34(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=465(x), r11=35(y), r12=32(width), r13=44(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 158
LDI r1, 179
LDI r2, 190
LDI r3, 198
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 397
LDI r6, 79
LDI r7, 34
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 465
LDI r11, 35
LDI r12, 32
LDI r13, 44
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
