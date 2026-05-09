; DESCRIPTION: Composite: Renders a red line between points (74, 66) and (66, 171) then Creates a magenta circular shape at (256, 186) with radius 69 then Draws a black rectangle at (293, 131) with width 118 and height 72.
; PLAN: r0=74(x1), r1=66(y1), r2=66(x2), r3=171(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=256(x), r6=186(y), r7=69(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=293(x), r11=131(y), r12=118(width), r13=72(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 74
LDI r1, 66
LDI r2, 66
LDI r3, 171
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 256
LDI r6, 186
LDI r7, 69
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 293
LDI r11, 131
LDI r12, 118
LDI r13, 72
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
