; DESCRIPTION: Composite: Draws a black circle centered at (79, 118) with radius 51 then Places a orange dot at position (338, 158) then Places a magenta 112x70 rectangle at position (271, 182).
; PLAN: r0=79(x), r1=118(y), r2=51(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=338(x), r6=158(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=271(x), r11=182(y), r12=112(width), r13=70(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 79
LDI r1, 118
LDI r2, 51
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 338
LDI r6, 158
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 271
LDI r11, 182
LDI r12, 112
LDI r13, 70
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
