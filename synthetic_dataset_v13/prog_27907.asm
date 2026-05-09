; DESCRIPTION: Composite: Places a purple 108x61 rectangle at position (149, 177) then Creates a green circular shape at (41, 205) with radius 13 then Draws a red line from (258, 134) to (498, 150).
; PLAN: r0=149(x), r1=177(y), r2=108(width), r3=61(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=41(x), r6=205(y), r7=13(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=258(x1), r11=134(y1), r12=498(x2), r13=150(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 149
LDI r1, 177
LDI r2, 108
LDI r3, 61
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 41
LDI r6, 205
LDI r7, 13
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 258
LDI r11, 134
LDI r12, 498
LDI r13, 150
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
