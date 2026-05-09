; DESCRIPTION: Composite: Renders a cyan box of size 22x84 starting at (308, 76) then Places a blue dot at position (285, 218) then Places a purple circle of radius 13 at center (115, 62).
; PLAN: r0=308(x), r1=76(y), r2=22(width), r3=84(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=285(x), r6=218(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=115(x), r11=62(y), r12=13(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 308
LDI r1, 76
LDI r2, 22
LDI r3, 84
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 285
LDI r6, 218
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 115
LDI r11, 62
LDI r12, 13
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
