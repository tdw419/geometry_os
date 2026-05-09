; DESCRIPTION: Composite: Creates a orange rectangular region at (285, 69) spanning 88 by 85 pixels then Places a yellow dot at position (68, 72) then Places a green circle of radius 19 at center (487, 219).
; PLAN: r0=285(x), r1=69(y), r2=88(width), r3=85(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=68(x), r6=72(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=487(x), r11=219(y), r12=19(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 285
LDI r1, 69
LDI r2, 88
LDI r3, 85
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 68
LDI r6, 72
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 487
LDI r11, 219
LDI r12, 19
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
