; DESCRIPTION: Composite: Creates a orange circular shape at (278, 146) with radius 61 then Sets a single magenta pixel at (205, 53) then Draws a yellow rectangle at (232, 18) with width 79 and height 12.
; PLAN: r0=278(x), r1=146(y), r2=61(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=205(x), r6=53(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=232(x), r11=18(y), r12=79(width), r13=12(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 278
LDI r1, 146
LDI r2, 61
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 205
LDI r6, 53
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 232
LDI r11, 18
LDI r12, 79
LDI r13, 12
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
