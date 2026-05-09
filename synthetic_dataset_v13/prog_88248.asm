; DESCRIPTION: Composite: Places a purple dot at position (489, 99) then Renders a white disk with center (429, 191) and radius 41 then Renders a orange line between points (380, 97) and (420, 159).
; PLAN: r0=489(x), r1=99(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=429(x), r6=191(y), r7=41(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=380(x1), r11=97(y1), r12=420(x2), r13=159(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 489
LDI r1, 99
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 429
LDI r6, 191
LDI r7, 41
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 380
LDI r11, 97
LDI r12, 420
LDI r13, 159
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
