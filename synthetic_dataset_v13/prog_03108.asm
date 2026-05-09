; DESCRIPTION: Composite: Sets a single green pixel at (172, 38) then Places a cyan line segment connecting (267, 59) to (235, 209).
; PLAN: r0=172(x), r1=38(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=267(x1), r6=59(y1), r7=235(x2), r8=209(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 172
LDI r1, 38
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 267
LDI r6, 59
LDI r7, 235
LDI r8, 209
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
