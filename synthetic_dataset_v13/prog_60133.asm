; DESCRIPTION: Composite: Renders a blue box of size 64x78 starting at (369, 91) then Sets a single yellow pixel at (183, 193) then Places a cyan circle of radius 48 at center (337, 99).
; PLAN: r0=369(x), r1=91(y), r2=64(width), r3=78(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=183(x), r6=193(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=337(x), r11=99(y), r12=48(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 369
LDI r1, 91
LDI r2, 64
LDI r3, 78
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 183
LDI r6, 193
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 337
LDI r11, 99
LDI r12, 48
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
