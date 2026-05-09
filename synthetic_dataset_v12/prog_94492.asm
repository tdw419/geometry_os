; DESCRIPTION: Composite: Renders a orange line between points (58, 22) and (474, 177) then Sets a single cyan pixel at (12, 41).
; PLAN: r0=58(x1), r1=22(y1), r2=474(x2), r3=177(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=12(x), r6=41(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 58
LDI r1, 22
LDI r2, 474
LDI r3, 177
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 12
LDI r6, 41
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
