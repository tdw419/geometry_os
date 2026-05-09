; DESCRIPTION: Composite: Places a green circle of radius 19 at center (214, 214) then Sets a single orange pixel at (281, 83) then Draws a blue rectangle at (285, 53) with width 39 and height 115.
; PLAN: r0=214(x), r1=214(y), r2=19(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=281(x), r6=83(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=285(x), r11=53(y), r12=39(width), r13=115(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 214
LDI r1, 214
LDI r2, 19
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 281
LDI r6, 83
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 285
LDI r11, 53
LDI r12, 39
LDI r13, 115
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
