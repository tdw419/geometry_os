; DESCRIPTION: Composite: Sets a single magenta pixel at (141, 48) then Places a cyan line segment connecting (391, 18) to (261, 124).
; PLAN: r0=141(x), r1=48(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=391(x1), r6=18(y1), r7=261(x2), r8=124(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 141
LDI r1, 48
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 391
LDI r6, 18
LDI r7, 261
LDI r8, 124
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
