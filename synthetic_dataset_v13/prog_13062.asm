; DESCRIPTION: Composite: Places a orange dot at position (471, 76) then Places a black 111x113 rectangle at position (310, 18) then Renders a green line between points (501, 89) and (430, 119).
; PLAN: r0=471(x), r1=76(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=310(x), r6=18(y), r7=111(width), r8=113(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=501(x1), r11=89(y1), r12=430(x2), r13=119(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 471
LDI r1, 76
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 310
LDI r6, 18
LDI r7, 111
LDI r8, 113
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 501
LDI r11, 89
LDI r12, 430
LDI r13, 119
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
