; DESCRIPTION: Composite: Renders a black box of size 37x10 starting at (62, 72) then Sets a single yellow pixel at (81, 139) then Places a yellow circle of radius 27 at center (315, 136).
; PLAN: r0=62(x), r1=72(y), r2=37(width), r3=10(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=81(x), r6=139(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=315(x), r11=136(y), r12=27(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 62
LDI r1, 72
LDI r2, 37
LDI r3, 10
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 81
LDI r6, 139
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 315
LDI r11, 136
LDI r12, 27
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
