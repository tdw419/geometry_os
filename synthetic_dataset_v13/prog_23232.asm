; DESCRIPTION: Composite: Sets a single yellow pixel at (238, 156) then Places a yellow line segment connecting (395, 184) to (491, 122).
; PLAN: r0=238(x), r1=156(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=395(x1), r6=184(y1), r7=491(x2), r8=122(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 238
LDI r1, 156
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 395
LDI r6, 184
LDI r7, 491
LDI r8, 122
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
