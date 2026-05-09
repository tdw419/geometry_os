; DESCRIPTION: Composite: Sets a single black pixel at (71, 56) then Renders a black box of size 18x112 starting at (245, 118) then Creates a blue circular shape at (85, 66) with radius 47.
; PLAN: r0=71(x), r1=56(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=245(x), r6=118(y), r7=18(width), r8=112(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=85(x), r11=66(y), r12=47(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 71
LDI r1, 56
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 245
LDI r6, 118
LDI r7, 18
LDI r8, 112
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 85
LDI r11, 66
LDI r12, 47
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
