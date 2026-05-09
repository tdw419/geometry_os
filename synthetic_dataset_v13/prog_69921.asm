; DESCRIPTION: Composite: Draws a black circle centered at (113, 86) with radius 56 then Sets a single yellow pixel at (292, 115) then Renders a green box of size 59x32 starting at (335, 157).
; PLAN: r0=113(x), r1=86(y), r2=56(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=292(x), r6=115(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=335(x), r11=157(y), r12=59(width), r13=32(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 113
LDI r1, 86
LDI r2, 56
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 292
LDI r6, 115
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 335
LDI r11, 157
LDI r12, 59
LDI r13, 32
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
