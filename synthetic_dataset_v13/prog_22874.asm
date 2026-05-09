; DESCRIPTION: Composite: Draws a green circle centered at (416, 84) with radius 76 then Places a purple 14x58 rectangle at position (355, 23).
; PLAN: r0=416(x), r1=84(y), r2=76(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=355(x), r6=23(y), r7=14(width), r8=58(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 416
LDI r1, 84
LDI r2, 76
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 355
LDI r6, 23
LDI r7, 14
LDI r8, 58
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
