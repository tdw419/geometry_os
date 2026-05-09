; DESCRIPTION: Composite: Draws a white line from (379, 159) to (168, 72) then Draws a orange rectangle at (476, 89) with width 18 and height 73 then Places a yellow dot at position (85, 112).
; PLAN: r0=379(x1), r1=159(y1), r2=168(x2), r3=72(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=476(x), r6=89(y), r7=18(width), r8=73(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=85(x), r11=112(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 379
LDI r1, 159
LDI r2, 168
LDI r3, 72
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 476
LDI r6, 89
LDI r7, 18
LDI r8, 73
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 85
LDI r11, 112
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
