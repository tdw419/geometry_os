; DESCRIPTION: Composite: Places a orange line segment connecting (164, 90) to (329, 29) then Places a blue 57x41 rectangle at position (31, 211) then Places a yellow circle of radius 63 at center (418, 100).
; PLAN: r0=164(x1), r1=90(y1), r2=329(x2), r3=29(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=31(x), r6=211(y), r7=57(width), r8=41(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=418(x), r11=100(y), r12=63(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 164
LDI r1, 90
LDI r2, 329
LDI r3, 29
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 31
LDI r6, 211
LDI r7, 57
LDI r8, 41
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 418
LDI r11, 100
LDI r12, 63
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
