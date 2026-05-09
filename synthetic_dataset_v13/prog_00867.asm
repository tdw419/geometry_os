; DESCRIPTION: Composite: Draws a black circle centered at (446, 187) with radius 62 then Draws a orange line from (96, 187) to (281, 184) then Places a green 81x66 rectangle at position (134, 61).
; PLAN: r0=446(x), r1=187(y), r2=62(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=96(x1), r6=187(y1), r7=281(x2), r8=184(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=134(x), r11=61(y), r12=81(width), r13=66(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 446
LDI r1, 187
LDI r2, 62
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 96
LDI r6, 187
LDI r7, 281
LDI r8, 184
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 134
LDI r11, 61
LDI r12, 81
LDI r13, 66
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
