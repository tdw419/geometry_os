; DESCRIPTION: Composite: Sets a single cyan pixel at (62, 125) then Places a cyan line segment connecting (275, 124) to (448, 19).
; PLAN: r0=62(x), r1=125(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=275(x1), r6=124(y1), r7=448(x2), r8=19(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 62
LDI r1, 125
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 275
LDI r6, 124
LDI r7, 448
LDI r8, 19
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
