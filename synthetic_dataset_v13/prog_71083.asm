; DESCRIPTION: Composite: Places a yellow circle of radius 80 at center (155, 83) then Renders a cyan box of size 42x17 starting at (152, 215) then Places a cyan line segment connecting (105, 199) to (459, 175).
; PLAN: r0=155(x), r1=83(y), r2=80(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=152(x), r6=215(y), r7=42(width), r8=17(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=105(x1), r11=199(y1), r12=459(x2), r13=175(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 155
LDI r1, 83
LDI r2, 80
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 152
LDI r6, 215
LDI r7, 42
LDI r8, 17
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 105
LDI r11, 199
LDI r12, 459
LDI r13, 175
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
