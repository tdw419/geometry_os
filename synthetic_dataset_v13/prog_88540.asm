; DESCRIPTION: Composite: Places a magenta line segment connecting (261, 239) to (95, 172) then Places a orange circle of radius 80 at center (117, 114) then Renders a green box of size 110x83 starting at (212, 141).
; PLAN: r0=261(x1), r1=239(y1), r2=95(x2), r3=172(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=117(x), r6=114(y), r7=80(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=212(x), r11=141(y), r12=110(width), r13=83(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 261
LDI r1, 239
LDI r2, 95
LDI r3, 172
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 117
LDI r6, 114
LDI r7, 80
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 212
LDI r11, 141
LDI r12, 110
LDI r13, 83
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
