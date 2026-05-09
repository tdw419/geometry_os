; DESCRIPTION: Composite: Sets a single cyan pixel at (80, 45) then Places a blue line segment connecting (475, 233) to (296, 201).
; PLAN: r0=80(x), r1=45(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=475(x1), r6=233(y1), r7=296(x2), r8=201(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 80
LDI r1, 45
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 475
LDI r6, 233
LDI r7, 296
LDI r8, 201
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
