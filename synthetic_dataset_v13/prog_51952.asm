; DESCRIPTION: Composite: Creates a red rectangular region at (85, 133) spanning 85 by 109 pixels then Places a black dot at position (254, 132) then Draws a blue circle centered at (354, 96) with radius 70.
; PLAN: r0=85(x), r1=133(y), r2=85(width), r3=109(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=254(x), r6=132(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=354(x), r11=96(y), r12=70(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 85
LDI r1, 133
LDI r2, 85
LDI r3, 109
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 254
LDI r6, 132
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 354
LDI r11, 96
LDI r12, 70
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
