; DESCRIPTION: Composite: Renders a red box of size 42x14 starting at (115, 62) then Sets a single yellow pixel at (14, 199) then Renders a orange disk with center (307, 121) and radius 78.
; PLAN: r0=115(x), r1=62(y), r2=42(width), r3=14(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=14(x), r6=199(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=307(x), r11=121(y), r12=78(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 115
LDI r1, 62
LDI r2, 42
LDI r3, 14
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 14
LDI r6, 199
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 307
LDI r11, 121
LDI r12, 78
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
