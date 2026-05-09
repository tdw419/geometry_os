; DESCRIPTION: Composite: Places a magenta 98x107 rectangle at position (182, 89) then Renders a orange line between points (140, 39) and (491, 18) then Renders a orange disk with center (361, 42) and radius 38.
; PLAN: r0=182(x), r1=89(y), r2=98(width), r3=107(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=140(x1), r6=39(y1), r7=491(x2), r8=18(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=361(x), r11=42(y), r12=38(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 182
LDI r1, 89
LDI r2, 98
LDI r3, 107
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 140
LDI r6, 39
LDI r7, 491
LDI r8, 18
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 361
LDI r11, 42
LDI r12, 38
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
