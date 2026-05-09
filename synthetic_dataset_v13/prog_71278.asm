; DESCRIPTION: Composite: Places a black line segment connecting (257, 71) to (254, 142) then Places a purple dot at position (129, 26) then Places a cyan 18x58 rectangle at position (159, 157).
; PLAN: r0=257(x1), r1=71(y1), r2=254(x2), r3=142(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=129(x), r6=26(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=159(x), r11=157(y), r12=18(width), r13=58(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 257
LDI r1, 71
LDI r2, 254
LDI r3, 142
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 129
LDI r6, 26
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 159
LDI r11, 157
LDI r12, 18
LDI r13, 58
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
