; DESCRIPTION: Composite: Places a purple 28x96 rectangle at position (187, 64) then Creates a red circular shape at (460, 137) with radius 15 then Renders a purple line between points (390, 127) and (508, 26).
; PLAN: r0=187(x), r1=64(y), r2=28(width), r3=96(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=460(x), r6=137(y), r7=15(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=390(x1), r11=127(y1), r12=508(x2), r13=26(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 187
LDI r1, 64
LDI r2, 28
LDI r3, 96
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 460
LDI r6, 137
LDI r7, 15
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 390
LDI r11, 127
LDI r12, 508
LDI r13, 26
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
