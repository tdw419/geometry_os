; DESCRIPTION: Composite: Sets a single black pixel at (357, 186) then Places a blue line segment connecting (173, 232) to (41, 100).
; PLAN: r0=357(x), r1=186(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=173(x1), r6=232(y1), r7=41(x2), r8=100(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 357
LDI r1, 186
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 173
LDI r6, 232
LDI r7, 41
LDI r8, 100
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
