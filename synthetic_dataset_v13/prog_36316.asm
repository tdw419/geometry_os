; DESCRIPTION: Composite: Draws a black circle centered at (396, 160) with radius 71 then Places a cyan 88x101 rectangle at position (191, 89) then Draws a yellow line from (79, 39) to (212, 116).
; PLAN: r0=396(x), r1=160(y), r2=71(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=191(x), r6=89(y), r7=88(width), r8=101(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=79(x1), r11=39(y1), r12=212(x2), r13=116(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 396
LDI r1, 160
LDI r2, 71
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 191
LDI r6, 89
LDI r7, 88
LDI r8, 101
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 79
LDI r11, 39
LDI r12, 212
LDI r13, 116
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
