; DESCRIPTION: Composite: Renders a red box of size 98x114 starting at (36, 49) then Places a magenta circle of radius 64 at center (178, 99) then Sets a single orange pixel at (123, 62).
; PLAN: r0=36(x), r1=49(y), r2=98(width), r3=114(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=178(x), r6=99(y), r7=64(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=123(x), r11=62(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 36
LDI r1, 49
LDI r2, 98
LDI r3, 114
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 178
LDI r6, 99
LDI r7, 64
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 123
LDI r11, 62
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
