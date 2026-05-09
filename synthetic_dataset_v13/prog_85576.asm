; DESCRIPTION: Composite: Places a green dot at position (116, 41) then Draws a white line from (457, 35) to (349, 76) then Draws a orange rectangle at (87, 23) with width 63 and height 117.
; PLAN: r0=116(x), r1=41(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=457(x1), r6=35(y1), r7=349(x2), r8=76(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=87(x), r11=23(y), r12=63(width), r13=117(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 116
LDI r1, 41
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 457
LDI r6, 35
LDI r7, 349
LDI r8, 76
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 87
LDI r11, 23
LDI r12, 63
LDI r13, 117
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
