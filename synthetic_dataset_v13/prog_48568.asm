; DESCRIPTION: Composite: Draws a orange rectangle at (315, 134) with width 116 and height 89 then Places a yellow dot at position (384, 19) then Renders a blue line between points (399, 179) and (30, 13).
; PLAN: r0=315(x), r1=134(y), r2=116(width), r3=89(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=384(x), r6=19(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=399(x1), r11=179(y1), r12=30(x2), r13=13(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 315
LDI r1, 134
LDI r2, 116
LDI r3, 89
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 384
LDI r6, 19
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 399
LDI r11, 179
LDI r12, 30
LDI r13, 13
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
