; DESCRIPTION: Composite: Draws a cyan line from (473, 21) to (31, 45) then Draws a green rectangle at (148, 41) with width 63 and height 36 then Places a cyan dot at position (457, 116).
; PLAN: r0=473(x1), r1=21(y1), r2=31(x2), r3=45(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=148(x), r6=41(y), r7=63(width), r8=36(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=457(x), r11=116(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 473
LDI r1, 21
LDI r2, 31
LDI r3, 45
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 148
LDI r6, 41
LDI r7, 63
LDI r8, 36
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 457
LDI r11, 116
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
