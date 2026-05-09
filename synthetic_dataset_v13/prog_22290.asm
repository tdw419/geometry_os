; DESCRIPTION: Composite: Places a purple 82x93 rectangle at position (201, 36) then Sets a single cyan pixel at (490, 60) then Creates a green circular shape at (110, 124) with radius 73.
; PLAN: r0=201(x), r1=36(y), r2=82(width), r3=93(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=490(x), r6=60(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=110(x), r11=124(y), r12=73(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 201
LDI r1, 36
LDI r2, 82
LDI r3, 93
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 490
LDI r6, 60
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 110
LDI r11, 124
LDI r12, 73
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
