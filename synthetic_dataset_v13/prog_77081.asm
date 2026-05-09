; DESCRIPTION: Composite: Sets a single orange pixel at (226, 126) then Draws a green rectangle at (14, 41) with width 36 and height 11 then Renders a white line between points (281, 101) and (283, 109).
; PLAN: r0=226(x), r1=126(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=14(x), r6=41(y), r7=36(width), r8=11(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=281(x1), r11=101(y1), r12=283(x2), r13=109(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 226
LDI r1, 126
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 14
LDI r6, 41
LDI r7, 36
LDI r8, 11
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 281
LDI r11, 101
LDI r12, 283
LDI r13, 109
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
