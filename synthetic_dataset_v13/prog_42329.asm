; DESCRIPTION: Composite: Places a purple line segment connecting (273, 182) to (306, 7) then Places a orange circle of radius 67 at center (194, 103) then Places a green 110x55 rectangle at position (66, 2).
; PLAN: r0=273(x1), r1=182(y1), r2=306(x2), r3=7(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=194(x), r6=103(y), r7=67(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=66(x), r11=2(y), r12=110(width), r13=55(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 273
LDI r1, 182
LDI r2, 306
LDI r3, 7
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 194
LDI r6, 103
LDI r7, 67
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 66
LDI r11, 2
LDI r12, 110
LDI r13, 55
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
