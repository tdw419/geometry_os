; DESCRIPTION: Composite: Renders a purple box of size 113x96 starting at (25, 116) then Places a yellow dot at position (176, 26) then Places a black circle of radius 49 at center (62, 114).
; PLAN: r0=25(x), r1=116(y), r2=113(width), r3=96(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=176(x), r6=26(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=62(x), r11=114(y), r12=49(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 25
LDI r1, 116
LDI r2, 113
LDI r3, 96
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 176
LDI r6, 26
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 62
LDI r11, 114
LDI r12, 49
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
