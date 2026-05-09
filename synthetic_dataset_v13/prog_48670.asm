; DESCRIPTION: Composite: Sets a single cyan pixel at (182, 124) then Draws a black line from (225, 140) to (458, 255).
; PLAN: r0=182(x), r1=124(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=225(x1), r6=140(y1), r7=458(x2), r8=255(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 182
LDI r1, 124
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 225
LDI r6, 140
LDI r7, 458
LDI r8, 255
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
