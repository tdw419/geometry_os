; DESCRIPTION: Composite: Sets a single purple pixel at (106, 80) then Draws a yellow line from (115, 64) to (30, 34).
; PLAN: r0=106(x), r1=80(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=115(x1), r6=64(y1), r7=30(x2), r8=34(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 106
LDI r1, 80
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 115
LDI r6, 64
LDI r7, 30
LDI r8, 34
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
