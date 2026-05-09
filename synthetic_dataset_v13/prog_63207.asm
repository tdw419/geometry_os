; DESCRIPTION: Composite: Sets a single yellow pixel at (261, 178) then Places a blue line segment connecting (237, 41) to (454, 141).
; PLAN: r0=261(x), r1=178(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=237(x1), r6=41(y1), r7=454(x2), r8=141(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 261
LDI r1, 178
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 237
LDI r6, 41
LDI r7, 454
LDI r8, 141
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
