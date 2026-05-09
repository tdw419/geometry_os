; DESCRIPTION: Composite: Sets a single cyan pixel at (124, 246) then Places a white line segment connecting (497, 164) to (214, 235).
; PLAN: r0=124(x), r1=246(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=497(x1), r6=164(y1), r7=214(x2), r8=235(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 124
LDI r1, 246
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 497
LDI r6, 164
LDI r7, 214
LDI r8, 235
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
