; DESCRIPTION: Composite: Places a yellow line segment connecting (451, 110) to (215, 41) then Places a yellow dot at position (106, 38).
; PLAN: r0=451(x1), r1=110(y1), r2=215(x2), r3=41(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=106(x), r6=38(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 451
LDI r1, 110
LDI r2, 215
LDI r3, 41
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 106
LDI r6, 38
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
