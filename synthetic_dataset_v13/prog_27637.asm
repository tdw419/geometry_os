; DESCRIPTION: Composite: Renders a black line between points (383, 138) and (269, 43) then Places a purple circle of radius 66 at center (114, 66) then Renders a purple box of size 82x25 starting at (179, 199).
; PLAN: r0=383(x1), r1=138(y1), r2=269(x2), r3=43(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=114(x), r6=66(y), r7=66(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=179(x), r11=199(y), r12=82(width), r13=25(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 383
LDI r1, 138
LDI r2, 269
LDI r3, 43
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 114
LDI r6, 66
LDI r7, 66
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 179
LDI r11, 199
LDI r12, 82
LDI r13, 25
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
