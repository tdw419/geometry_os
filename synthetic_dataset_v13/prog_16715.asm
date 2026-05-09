; DESCRIPTION: Composite: Places a purple dot at position (149, 188) then Creates a black circular shape at (77, 127) with radius 49 then Renders a purple box of size 111x22 starting at (155, 14).
; PLAN: r0=149(x), r1=188(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=77(x), r6=127(y), r7=49(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=155(x), r11=14(y), r12=111(width), r13=22(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 149
LDI r1, 188
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 77
LDI r6, 127
LDI r7, 49
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 155
LDI r11, 14
LDI r12, 111
LDI r13, 22
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
