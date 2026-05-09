; DESCRIPTION: Composite: Places a orange line segment connecting (274, 213) to (53, 0) then Creates a yellow rectangular region at (242, 61) spanning 35 by 114 pixels then Renders a black disk with center (257, 148) and radius 65.
; PLAN: r0=274(x1), r1=213(y1), r2=53(x2), r3=0(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=242(x), r6=61(y), r7=35(width), r8=114(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=257(x), r11=148(y), r12=65(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 274
LDI r1, 213
LDI r2, 53
LDI r3, 0
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 242
LDI r6, 61
LDI r7, 35
LDI r8, 114
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 257
LDI r11, 148
LDI r12, 65
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
