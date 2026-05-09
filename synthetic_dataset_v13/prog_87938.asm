; DESCRIPTION: Composite: Creates a purple circular shape at (181, 153) with radius 71 then Renders a magenta box of size 115x38 starting at (290, 45) then Places a yellow line segment connecting (141, 125) to (442, 79).
; PLAN: r0=181(x), r1=153(y), r2=71(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=290(x), r6=45(y), r7=115(width), r8=38(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=141(x1), r11=125(y1), r12=442(x2), r13=79(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 181
LDI r1, 153
LDI r2, 71
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 290
LDI r6, 45
LDI r7, 115
LDI r8, 38
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 141
LDI r11, 125
LDI r12, 442
LDI r13, 79
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
