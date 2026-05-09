; DESCRIPTION: Composite: Draws a black line from (180, 132) to (259, 60) then Creates a blue circular shape at (396, 182) with radius 34 then Places a black 99x97 rectangle at position (119, 112).
; PLAN: r0=180(x1), r1=132(y1), r2=259(x2), r3=60(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=396(x), r6=182(y), r7=34(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=119(x), r11=112(y), r12=99(width), r13=97(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 180
LDI r1, 132
LDI r2, 259
LDI r3, 60
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 396
LDI r6, 182
LDI r7, 34
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 119
LDI r11, 112
LDI r12, 99
LDI r13, 97
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
