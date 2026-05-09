; DESCRIPTION: Composite: Renders a purple disk with center (210, 125) and radius 69 then Creates a orange rectangular region at (399, 136) spanning 100 by 86 pixels then Renders a yellow line between points (311, 207) and (51, 215).
; PLAN: r0=210(x), r1=125(y), r2=69(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=399(x), r6=136(y), r7=100(width), r8=86(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=311(x1), r11=207(y1), r12=51(x2), r13=215(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 210
LDI r1, 125
LDI r2, 69
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 399
LDI r6, 136
LDI r7, 100
LDI r8, 86
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 311
LDI r11, 207
LDI r12, 51
LDI r13, 215
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
