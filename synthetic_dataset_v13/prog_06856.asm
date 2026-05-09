; DESCRIPTION: Composite: Creates a white circular shape at (73, 68) with radius 66 then Renders a red box of size 72x43 starting at (101, 198) then Sets a single blue pixel at (86, 158).
; PLAN: r0=73(x), r1=68(y), r2=66(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=101(x), r6=198(y), r7=72(width), r8=43(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=86(x), r11=158(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 73
LDI r1, 68
LDI r2, 66
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 101
LDI r6, 198
LDI r7, 72
LDI r8, 43
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 86
LDI r11, 158
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
