; DESCRIPTION: Composite: Places a white 95x69 rectangle at position (79, 71) then Renders a purple disk with center (101, 164) and radius 12 then Renders a magenta line between points (146, 158) and (506, 162).
; PLAN: r0=79(x), r1=71(y), r2=95(width), r3=69(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=101(x), r6=164(y), r7=12(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=146(x1), r11=158(y1), r12=506(x2), r13=162(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 79
LDI r1, 71
LDI r2, 95
LDI r3, 69
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 101
LDI r6, 164
LDI r7, 12
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 146
LDI r11, 158
LDI r12, 506
LDI r13, 162
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
