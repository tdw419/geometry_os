; DESCRIPTION: Composite: Sets a single magenta pixel at (148, 155) then Draws a red circle centered at (195, 53) with radius 28 then Draws a blue rectangle at (200, 81) with width 52 and height 87.
; PLAN: r0=148(x), r1=155(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=195(x), r6=53(y), r7=28(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=200(x), r11=81(y), r12=52(width), r13=87(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 148
LDI r1, 155
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 195
LDI r6, 53
LDI r7, 28
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 200
LDI r11, 81
LDI r12, 52
LDI r13, 87
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
