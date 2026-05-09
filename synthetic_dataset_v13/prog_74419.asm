; DESCRIPTION: Composite: Places a magenta line segment connecting (342, 232) to (31, 27) then Renders a red disk with center (65, 175) and radius 50 then Places a purple 19x35 rectangle at position (273, 122).
; PLAN: r0=342(x1), r1=232(y1), r2=31(x2), r3=27(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=65(x), r6=175(y), r7=50(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=273(x), r11=122(y), r12=19(width), r13=35(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 342
LDI r1, 232
LDI r2, 31
LDI r3, 27
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 65
LDI r6, 175
LDI r7, 50
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 273
LDI r11, 122
LDI r12, 19
LDI r13, 35
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
