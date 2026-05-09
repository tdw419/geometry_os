; DESCRIPTION: Composite: Sets a single black pixel at (409, 95) then Renders a blue box of size 55x28 starting at (79, 21) then Creates a green circular shape at (463, 43) with radius 15.
; PLAN: r0=409(x), r1=95(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=79(x), r6=21(y), r7=55(width), r8=28(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=463(x), r11=43(y), r12=15(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 409
LDI r1, 95
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 79
LDI r6, 21
LDI r7, 55
LDI r8, 28
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 463
LDI r11, 43
LDI r12, 15
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
