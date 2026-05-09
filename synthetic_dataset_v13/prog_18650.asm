; DESCRIPTION: Composite: Renders a purple box of size 12x89 starting at (59, 153) then Renders a orange disk with center (440, 115) and radius 70 then Places a magenta line segment connecting (424, 241) to (281, 230).
; PLAN: r0=59(x), r1=153(y), r2=12(width), r3=89(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=440(x), r6=115(y), r7=70(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=424(x1), r11=241(y1), r12=281(x2), r13=230(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 59
LDI r1, 153
LDI r2, 12
LDI r3, 89
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 440
LDI r6, 115
LDI r7, 70
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 424
LDI r11, 241
LDI r12, 281
LDI r13, 230
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
