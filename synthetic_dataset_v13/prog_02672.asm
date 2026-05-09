; DESCRIPTION: Composite: Sets a single purple pixel at (376, 212) then Renders a cyan line between points (401, 227) and (141, 171).
; PLAN: r0=376(x), r1=212(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=401(x1), r6=227(y1), r7=141(x2), r8=171(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 376
LDI r1, 212
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 401
LDI r6, 227
LDI r7, 141
LDI r8, 171
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
