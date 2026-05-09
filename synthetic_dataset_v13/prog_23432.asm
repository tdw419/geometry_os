; DESCRIPTION: Composite: Places a black 116x26 rectangle at position (350, 21) then Places a black dot at position (178, 251) then Renders a purple line between points (140, 67) and (257, 7).
; PLAN: r0=350(x), r1=21(y), r2=116(width), r3=26(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=178(x), r6=251(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=140(x1), r11=67(y1), r12=257(x2), r13=7(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 350
LDI r1, 21
LDI r2, 116
LDI r3, 26
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 178
LDI r6, 251
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 140
LDI r11, 67
LDI r12, 257
LDI r13, 7
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
