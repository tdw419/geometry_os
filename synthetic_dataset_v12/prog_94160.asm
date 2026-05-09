; DESCRIPTION: Composite: Sets a single yellow pixel at (41, 168) then Draws a orange circle centered at (356, 207) with radius 22.
; PLAN: r0=41(x), r1=168(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=356(x), r6=207(y), r7=22(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 41
LDI r1, 168
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 356
LDI r6, 207
LDI r7, 22
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
