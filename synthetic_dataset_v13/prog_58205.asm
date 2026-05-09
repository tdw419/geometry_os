; DESCRIPTION: Composite: Sets a single yellow pixel at (187, 148) then Places a blue line segment connecting (333, 43) to (41, 101).
; PLAN: r0=187(x), r1=148(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=333(x1), r6=43(y1), r7=41(x2), r8=101(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 187
LDI r1, 148
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 333
LDI r6, 43
LDI r7, 41
LDI r8, 101
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
