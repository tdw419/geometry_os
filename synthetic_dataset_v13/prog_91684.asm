; DESCRIPTION: Composite: Renders a black box of size 101x101 starting at (236, 33) then Creates a purple circular shape at (386, 176) with radius 30 then Sets a single magenta pixel at (155, 55).
; PLAN: r0=236(x), r1=33(y), r2=101(width), r3=101(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=386(x), r6=176(y), r7=30(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=155(x), r11=55(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 236
LDI r1, 33
LDI r2, 101
LDI r3, 101
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 386
LDI r6, 176
LDI r7, 30
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 155
LDI r11, 55
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
