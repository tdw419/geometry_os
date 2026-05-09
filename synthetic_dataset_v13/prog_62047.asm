; DESCRIPTION: Composite: Renders a orange line between points (203, 163) and (11, 38) then Sets a single green pixel at (295, 89).
; PLAN: r0=203(x1), r1=163(y1), r2=11(x2), r3=38(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=295(x), r6=89(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 203
LDI r1, 163
LDI r2, 11
LDI r3, 38
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 295
LDI r6, 89
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
