; DESCRIPTION: Composite: Places a black circle of radius 80 at center (172, 97) then Places a black dot at position (33, 70) then Places a purple 90x111 rectangle at position (37, 128).
; PLAN: r0=172(x), r1=97(y), r2=80(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=33(x), r6=70(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=37(x), r11=128(y), r12=90(width), r13=111(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 172
LDI r1, 97
LDI r2, 80
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 33
LDI r6, 70
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 37
LDI r11, 128
LDI r12, 90
LDI r13, 111
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
