; DESCRIPTION: Composite: Renders a orange box of size 96x79 starting at (223, 147) then Creates a black circular shape at (322, 40) with radius 26.
; PLAN: r0=223(x), r1=147(y), r2=96(width), r3=79(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=322(x), r6=40(y), r7=26(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 223
LDI r1, 147
LDI r2, 96
LDI r3, 79
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 322
LDI r6, 40
LDI r7, 26
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
