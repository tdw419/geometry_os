; DESCRIPTION: Composite: Draws a cyan rectangle at (10, 94) with width 23 and height 85 then Places a cyan dot at position (265, 245) then Places a cyan line segment connecting (506, 77) to (207, 79).
; PLAN: r0=10(x), r1=94(y), r2=23(width), r3=85(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=265(x), r6=245(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=506(x1), r11=77(y1), r12=207(x2), r13=79(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 10
LDI r1, 94
LDI r2, 23
LDI r3, 85
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 265
LDI r6, 245
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 506
LDI r11, 77
LDI r12, 207
LDI r13, 79
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
