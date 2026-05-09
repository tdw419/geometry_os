; DESCRIPTION: Composite: Renders a orange line between points (475, 56) and (189, 178) then Places a cyan dot at position (202, 3) then Renders a purple box of size 34x94 starting at (85, 158).
; PLAN: r0=475(x1), r1=56(y1), r2=189(x2), r3=178(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=202(x), r6=3(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=85(x), r11=158(y), r12=34(width), r13=94(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 475
LDI r1, 56
LDI r2, 189
LDI r3, 178
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 202
LDI r6, 3
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 85
LDI r11, 158
LDI r12, 34
LDI r13, 94
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
