; DESCRIPTION: Composite: Places a green 84x65 rectangle at position (381, 49) then Places a blue dot at position (48, 110) then Places a purple circle of radius 19 at center (435, 131).
; PLAN: r0=381(x), r1=49(y), r2=84(width), r3=65(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=48(x), r6=110(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=435(x), r11=131(y), r12=19(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 381
LDI r1, 49
LDI r2, 84
LDI r3, 65
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 48
LDI r6, 110
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 435
LDI r11, 131
LDI r12, 19
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
