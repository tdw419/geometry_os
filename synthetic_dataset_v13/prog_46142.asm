; DESCRIPTION: Composite: Renders a orange line between points (397, 24) and (480, 193) then Places a magenta dot at position (126, 44) then Draws a black rectangle at (115, 150) with width 100 and height 76.
; PLAN: r0=397(x1), r1=24(y1), r2=480(x2), r3=193(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=126(x), r6=44(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=115(x), r11=150(y), r12=100(width), r13=76(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 397
LDI r1, 24
LDI r2, 480
LDI r3, 193
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 126
LDI r6, 44
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 115
LDI r11, 150
LDI r12, 100
LDI r13, 76
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
