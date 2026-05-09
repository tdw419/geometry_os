; DESCRIPTION: Composite: Sets a single black pixel at (47, 114) then Draws a orange rectangle at (286, 159) with width 74 and height 57 then Places a orange line segment connecting (222, 33) to (61, 89).
; PLAN: r0=47(x), r1=114(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=286(x), r6=159(y), r7=74(width), r8=57(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=222(x1), r11=33(y1), r12=61(x2), r13=89(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 47
LDI r1, 114
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 286
LDI r6, 159
LDI r7, 74
LDI r8, 57
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 222
LDI r11, 33
LDI r12, 61
LDI r13, 89
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
