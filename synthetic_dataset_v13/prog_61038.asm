; DESCRIPTION: Composite: Renders a red disk with center (129, 87) and radius 64 then Sets a single yellow pixel at (349, 207) then Draws a green rectangle at (208, 144) with width 35 and height 30.
; PLAN: r0=129(x), r1=87(y), r2=64(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=349(x), r6=207(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=208(x), r11=144(y), r12=35(width), r13=30(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 129
LDI r1, 87
LDI r2, 64
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 349
LDI r6, 207
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 208
LDI r11, 144
LDI r12, 35
LDI r13, 30
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
