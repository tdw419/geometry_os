; DESCRIPTION: Composite: Sets a single orange pixel at (101, 226) then Renders a black box of size 105x110 starting at (20, 62) then Renders a white disk with center (404, 78) and radius 54.
; PLAN: r0=101(x), r1=226(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=20(x), r6=62(y), r7=105(width), r8=110(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=404(x), r11=78(y), r12=54(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 101
LDI r1, 226
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 20
LDI r6, 62
LDI r7, 105
LDI r8, 110
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 404
LDI r11, 78
LDI r12, 54
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
