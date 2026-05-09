; DESCRIPTION: Composite: Places a blue 38x10 rectangle at position (65, 62) then Creates a purple circular shape at (237, 115) with radius 35 then Sets a single yellow pixel at (166, 165).
; PLAN: r0=65(x), r1=62(y), r2=38(width), r3=10(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=237(x), r6=115(y), r7=35(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=166(x), r11=165(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 65
LDI r1, 62
LDI r2, 38
LDI r3, 10
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 237
LDI r6, 115
LDI r7, 35
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 166
LDI r11, 165
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
