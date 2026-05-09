; DESCRIPTION: Composite: Places a black 109x41 rectangle at position (167, 56) then Sets a single green pixel at (182, 89) then Renders a blue line between points (143, 90) and (351, 61).
; PLAN: r0=167(x), r1=56(y), r2=109(width), r3=41(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=182(x), r6=89(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=143(x1), r11=90(y1), r12=351(x2), r13=61(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 167
LDI r1, 56
LDI r2, 109
LDI r3, 41
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 182
LDI r6, 89
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 143
LDI r11, 90
LDI r12, 351
LDI r13, 61
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
