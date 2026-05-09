; DESCRIPTION: Composite: Creates a white rectangular region at (399, 19) spanning 104 by 81 pixels then Draws a orange line from (131, 85) to (66, 234) then Places a red dot at position (48, 126).
; PLAN: r0=399(x), r1=19(y), r2=104(width), r3=81(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=131(x1), r6=85(y1), r7=66(x2), r8=234(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=48(x), r11=126(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 399
LDI r1, 19
LDI r2, 104
LDI r3, 81
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 131
LDI r6, 85
LDI r7, 66
LDI r8, 234
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 48
LDI r11, 126
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
