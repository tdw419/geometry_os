; DESCRIPTION: Composite: Renders a yellow box of size 36x52 starting at (176, 49) then Sets a single white pixel at (54, 1) then Places a green circle of radius 12 at center (497, 155).
; PLAN: r0=176(x), r1=49(y), r2=36(width), r3=52(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=54(x), r6=1(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=497(x), r11=155(y), r12=12(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 176
LDI r1, 49
LDI r2, 36
LDI r3, 52
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 54
LDI r6, 1
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 497
LDI r11, 155
LDI r12, 12
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
