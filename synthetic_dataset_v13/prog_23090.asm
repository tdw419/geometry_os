; DESCRIPTION: Composite: Places a red dot at position (288, 55) then Creates a green rectangular region at (211, 84) spanning 25 by 96 pixels then Creates a blue circular shape at (364, 53) with radius 34.
; PLAN: r0=288(x), r1=55(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=211(x), r6=84(y), r7=25(width), r8=96(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=364(x), r11=53(y), r12=34(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 288
LDI r1, 55
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 211
LDI r6, 84
LDI r7, 25
LDI r8, 96
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 364
LDI r11, 53
LDI r12, 34
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
