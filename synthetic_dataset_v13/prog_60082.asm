; DESCRIPTION: Composite: Draws a blue line from (182, 167) to (325, 64) then Creates a magenta circular shape at (277, 167) with radius 79 then Places a yellow 118x34 rectangle at position (265, 158).
; PLAN: r0=182(x1), r1=167(y1), r2=325(x2), r3=64(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=277(x), r6=167(y), r7=79(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=265(x), r11=158(y), r12=118(width), r13=34(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 182
LDI r1, 167
LDI r2, 325
LDI r3, 64
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 277
LDI r6, 167
LDI r7, 79
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 265
LDI r11, 158
LDI r12, 118
LDI r13, 34
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
