; DESCRIPTION: Composite: Renders a yellow box of size 28x14 starting at (264, 142) then Sets a single orange pixel at (287, 139) then Creates a magenta circular shape at (157, 149) with radius 80.
; PLAN: r0=264(x), r1=142(y), r2=28(width), r3=14(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=287(x), r6=139(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=157(x), r11=149(y), r12=80(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 264
LDI r1, 142
LDI r2, 28
LDI r3, 14
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 287
LDI r6, 139
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 157
LDI r11, 149
LDI r12, 80
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
