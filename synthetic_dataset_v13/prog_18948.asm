; DESCRIPTION: Composite: Sets a single purple pixel at (138, 212) then Places a cyan line segment connecting (119, 200) to (59, 215).
; PLAN: r0=138(x), r1=212(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=119(x1), r6=200(y1), r7=59(x2), r8=215(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 138
LDI r1, 212
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 119
LDI r6, 200
LDI r7, 59
LDI r8, 215
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
