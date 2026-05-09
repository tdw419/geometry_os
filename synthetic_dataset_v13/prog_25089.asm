; DESCRIPTION: Composite: Places a white 86x108 rectangle at position (12, 122) then Creates a blue circular shape at (59, 201) with radius 14 then Sets a single white pixel at (25, 49).
; PLAN: r0=12(x), r1=122(y), r2=86(width), r3=108(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=59(x), r6=201(y), r7=14(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=25(x), r11=49(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 12
LDI r1, 122
LDI r2, 86
LDI r3, 108
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 59
LDI r6, 201
LDI r7, 14
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 25
LDI r11, 49
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
