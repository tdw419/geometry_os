; DESCRIPTION: Composite: Draws a white rectangle at (244, 159) with width 41 and height 75 then Places a green dot at position (87, 78) then Draws a magenta line from (202, 161) to (454, 245).
; PLAN: r0=244(x), r1=159(y), r2=41(width), r3=75(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=87(x), r6=78(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=202(x1), r11=161(y1), r12=454(x2), r13=245(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 244
LDI r1, 159
LDI r2, 41
LDI r3, 75
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 87
LDI r6, 78
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 202
LDI r11, 161
LDI r12, 454
LDI r13, 245
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
