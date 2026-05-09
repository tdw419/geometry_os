; DESCRIPTION: Composite: Sets a single magenta pixel at (475, 33) then Renders a black box of size 34x23 starting at (456, 95) then Creates a black circular shape at (265, 189) with radius 66.
; PLAN: r0=475(x), r1=33(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=456(x), r6=95(y), r7=34(width), r8=23(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=265(x), r11=189(y), r12=66(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 475
LDI r1, 33
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 456
LDI r6, 95
LDI r7, 34
LDI r8, 23
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 265
LDI r11, 189
LDI r12, 66
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
