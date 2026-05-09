; DESCRIPTION: Composite: Creates a purple circular shape at (125, 157) with radius 74 then Renders a blue box of size 65x21 starting at (200, 222) then Sets a single orange pixel at (156, 88).
; PLAN: r0=125(x), r1=157(y), r2=74(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=200(x), r6=222(y), r7=65(width), r8=21(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=156(x), r11=88(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 125
LDI r1, 157
LDI r2, 74
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 200
LDI r6, 222
LDI r7, 65
LDI r8, 21
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 156
LDI r11, 88
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
