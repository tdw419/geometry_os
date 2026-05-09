; DESCRIPTION: Composite: Sets a single blue pixel at (143, 25) then Draws a cyan line from (86, 20) to (215, 147).
; PLAN: r0=143(x), r1=25(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=86(x1), r6=20(y1), r7=215(x2), r8=147(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 143
LDI r1, 25
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 86
LDI r6, 20
LDI r7, 215
LDI r8, 147
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
