; DESCRIPTION: Composite: Draws a blue line from (293, 238) to (449, 58) then Places a orange 54x49 rectangle at position (18, 117) then Creates a yellow circular shape at (107, 94) with radius 66.
; PLAN: r0=293(x1), r1=238(y1), r2=449(x2), r3=58(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=18(x), r6=117(y), r7=54(width), r8=49(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=107(x), r11=94(y), r12=66(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 293
LDI r1, 238
LDI r2, 449
LDI r3, 58
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 18
LDI r6, 117
LDI r7, 54
LDI r8, 49
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 107
LDI r11, 94
LDI r12, 66
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
