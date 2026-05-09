; DESCRIPTION: Composite: Draws a yellow circle centered at (236, 158) with radius 60 then Sets a single black pixel at (210, 137) then Draws a blue rectangle at (200, 53) with width 63 and height 57.
; PLAN: r0=236(x), r1=158(y), r2=60(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=210(x), r6=137(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=200(x), r11=53(y), r12=63(width), r13=57(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 236
LDI r1, 158
LDI r2, 60
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 210
LDI r6, 137
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 200
LDI r11, 53
LDI r12, 63
LDI r13, 57
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
