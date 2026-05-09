; DESCRIPTION: Composite: Draws a white circle centered at (313, 127) with radius 76 then Sets a single cyan pixel at (476, 166) then Draws a cyan rectangle at (24, 32) with width 63 and height 47.
; PLAN: r0=313(x), r1=127(y), r2=76(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=476(x), r6=166(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=24(x), r11=32(y), r12=63(width), r13=47(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 313
LDI r1, 127
LDI r2, 76
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 476
LDI r6, 166
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 24
LDI r11, 32
LDI r12, 63
LDI r13, 47
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
