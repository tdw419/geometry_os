; DESCRIPTION: Composite: Renders a green box of size 19x64 starting at (158, 45) then Sets a single blue pixel at (178, 192) then Draws a cyan circle centered at (254, 72) with radius 42.
; PLAN: r0=158(x), r1=45(y), r2=19(width), r3=64(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=178(x), r6=192(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=254(x), r11=72(y), r12=42(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 158
LDI r1, 45
LDI r2, 19
LDI r3, 64
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 178
LDI r6, 192
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 254
LDI r11, 72
LDI r12, 42
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
