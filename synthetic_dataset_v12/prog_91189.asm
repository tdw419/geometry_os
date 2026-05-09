; DESCRIPTION: Composite: Sets a single cyan pixel at (88, 68) then Places a orange line segment connecting (232, 230) to (458, 80).
; PLAN: r0=88(x), r1=68(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=232(x1), r6=230(y1), r7=458(x2), r8=80(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 88
LDI r1, 68
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 232
LDI r6, 230
LDI r7, 458
LDI r8, 80
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
