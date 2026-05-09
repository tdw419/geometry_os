; DESCRIPTION: Composite: Draws a orange line from (14, 41) to (122, 63) then Places a green 115x114 rectangle at position (115, 64).
; PLAN: r0=14(x1), r1=41(y1), r2=122(x2), r3=63(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=115(x), r6=64(y), r7=115(width), r8=114(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 14
LDI r1, 41
LDI r2, 122
LDI r3, 63
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 115
LDI r6, 64
LDI r7, 115
LDI r8, 114
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
