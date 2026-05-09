; DESCRIPTION: Composite: Sets a single yellow pixel at (481, 80) then Places a black line segment connecting (258, 111) to (220, 96).
; PLAN: r0=481(x), r1=80(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=258(x1), r6=111(y1), r7=220(x2), r8=96(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 481
LDI r1, 80
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 258
LDI r6, 111
LDI r7, 220
LDI r8, 96
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
