; DESCRIPTION: Composite: Renders a green disk with center (266, 73) and radius 30 then Places a purple dot at position (285, 91) then Draws a magenta rectangle at (389, 64) with width 68 and height 48.
; PLAN: r0=266(x), r1=73(y), r2=30(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=285(x), r6=91(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=389(x), r11=64(y), r12=68(width), r13=48(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 266
LDI r1, 73
LDI r2, 30
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 285
LDI r6, 91
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 389
LDI r11, 64
LDI r12, 68
LDI r13, 48
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
