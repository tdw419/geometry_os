; DESCRIPTION: Composite: Places a yellow dot at position (451, 222) then Places a black line segment connecting (41, 49) to (342, 195).
; PLAN: r0=451(x), r1=222(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=41(x1), r6=49(y1), r7=342(x2), r8=195(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 451
LDI r1, 222
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 41
LDI r6, 49
LDI r7, 342
LDI r8, 195
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
