; DESCRIPTION: Composite: Draws a white rectangle at (228, 34) with width 91 and height 101 then Sets a single orange pixel at (316, 109) then Draws a orange line from (231, 180) to (458, 127).
; PLAN: r0=228(x), r1=34(y), r2=91(width), r3=101(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=316(x), r6=109(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=231(x1), r11=180(y1), r12=458(x2), r13=127(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 228
LDI r1, 34
LDI r2, 91
LDI r3, 101
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 316
LDI r6, 109
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 231
LDI r11, 180
LDI r12, 458
LDI r13, 127
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
