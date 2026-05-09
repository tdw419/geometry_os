; DESCRIPTION: Composite: Renders a white line between points (139, 194) and (96, 122) then Places a black circle of radius 72 at center (387, 159) then Renders a black box of size 120x13 starting at (132, 238).
; PLAN: r0=139(x1), r1=194(y1), r2=96(x2), r3=122(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=387(x), r6=159(y), r7=72(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=132(x), r11=238(y), r12=120(width), r13=13(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 139
LDI r1, 194
LDI r2, 96
LDI r3, 122
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 387
LDI r6, 159
LDI r7, 72
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 132
LDI r11, 238
LDI r12, 120
LDI r13, 13
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
