; DESCRIPTION: Composite: Sets a single green pixel at (238, 74) then Places a cyan line segment connecting (349, 235) to (382, 182).
; PLAN: r0=238(x), r1=74(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=349(x1), r6=235(y1), r7=382(x2), r8=182(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 238
LDI r1, 74
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 349
LDI r6, 235
LDI r7, 382
LDI r8, 182
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
