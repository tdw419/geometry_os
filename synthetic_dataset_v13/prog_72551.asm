; DESCRIPTION: Composite: Sets a single cyan pixel at (422, 178) then Places a white line segment connecting (169, 98) to (338, 24).
; PLAN: r0=422(x), r1=178(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=169(x1), r6=98(y1), r7=338(x2), r8=24(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 422
LDI r1, 178
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 169
LDI r6, 98
LDI r7, 338
LDI r8, 24
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
