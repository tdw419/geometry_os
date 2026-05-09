; DESCRIPTION: Composite: Draws a blue circle centered at (383, 157) with radius 60 then Places a orange dot at position (219, 252) then Places a yellow 59x94 rectangle at position (244, 152).
; PLAN: r0=383(x), r1=157(y), r2=60(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=219(x), r6=252(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=244(x), r11=152(y), r12=59(width), r13=94(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 383
LDI r1, 157
LDI r2, 60
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 219
LDI r6, 252
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 244
LDI r11, 152
LDI r12, 59
LDI r13, 94
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
