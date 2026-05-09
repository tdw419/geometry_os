; DESCRIPTION: Composite: Places a yellow dot at position (464, 11) then Renders a purple box of size 98x108 starting at (289, 33) then Creates a black circular shape at (142, 81) with radius 14.
; PLAN: r0=464(x), r1=11(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=289(x), r6=33(y), r7=98(width), r8=108(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=142(x), r11=81(y), r12=14(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 464
LDI r1, 11
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 289
LDI r6, 33
LDI r7, 98
LDI r8, 108
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 142
LDI r11, 81
LDI r12, 14
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
