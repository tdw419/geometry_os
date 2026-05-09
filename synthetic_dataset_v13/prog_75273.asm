; DESCRIPTION: Composite: Renders a magenta line between points (237, 50) and (493, 95) then Places a white dot at position (219, 23) then Draws a orange rectangle at (361, 181) with width 85 and height 24.
; PLAN: r0=237(x1), r1=50(y1), r2=493(x2), r3=95(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=219(x), r6=23(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=361(x), r11=181(y), r12=85(width), r13=24(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 237
LDI r1, 50
LDI r2, 493
LDI r3, 95
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 219
LDI r6, 23
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 361
LDI r11, 181
LDI r12, 85
LDI r13, 24
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
