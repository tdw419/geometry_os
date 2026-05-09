; DESCRIPTION: Composite: Renders a purple line between points (51, 215) and (64, 226) then Draws a magenta rectangle at (173, 179) with width 35 and height 12 then Draws a orange circle centered at (131, 73) with radius 55.
; PLAN: r0=51(x1), r1=215(y1), r2=64(x2), r3=226(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=173(x), r6=179(y), r7=35(width), r8=12(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=131(x), r11=73(y), r12=55(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 51
LDI r1, 215
LDI r2, 64
LDI r3, 226
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 173
LDI r6, 179
LDI r7, 35
LDI r8, 12
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 131
LDI r11, 73
LDI r12, 55
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
