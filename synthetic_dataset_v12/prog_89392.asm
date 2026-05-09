; DESCRIPTION: Composite: Places a orange line segment connecting (165, 252) to (88, 137) then Places a cyan dot at position (95, 55).
; PLAN: r0=165(x1), r1=252(y1), r2=88(x2), r3=137(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=95(x), r6=55(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 165
LDI r1, 252
LDI r2, 88
LDI r3, 137
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 95
LDI r6, 55
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
