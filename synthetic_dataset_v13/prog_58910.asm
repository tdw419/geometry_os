; DESCRIPTION: Composite: Creates a cyan rectangular region at (333, 203) spanning 45 by 11 pixels then Creates a blue circular shape at (162, 185) with radius 39 then Renders a purple line between points (230, 240) and (425, 211).
; PLAN: r0=333(x), r1=203(y), r2=45(width), r3=11(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=162(x), r6=185(y), r7=39(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=230(x1), r11=240(y1), r12=425(x2), r13=211(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 333
LDI r1, 203
LDI r2, 45
LDI r3, 11
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 162
LDI r6, 185
LDI r7, 39
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 230
LDI r11, 240
LDI r12, 425
LDI r13, 211
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
