; DESCRIPTION: Composite: Renders a orange line between points (206, 7) and (232, 12) then Places a orange dot at position (341, 70).
; PLAN: r0=206(x1), r1=7(y1), r2=232(x2), r3=12(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=341(x), r6=70(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 206
LDI r1, 7
LDI r2, 232
LDI r3, 12
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 341
LDI r6, 70
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
