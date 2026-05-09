; DESCRIPTION: Composite: Renders a orange line between points (280, 103) and (194, 132) then Places a orange dot at position (353, 94).
; PLAN: r0=280(x1), r1=103(y1), r2=194(x2), r3=132(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=353(x), r6=94(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 280
LDI r1, 103
LDI r2, 194
LDI r3, 132
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 353
LDI r6, 94
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
