; DESCRIPTION: Composite: Sets a single cyan pixel at (235, 94) then Renders a magenta line between points (135, 16) and (20, 52).
; PLAN: r0=235(x), r1=94(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=135(x1), r6=16(y1), r7=20(x2), r8=52(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 235
LDI r1, 94
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 135
LDI r6, 16
LDI r7, 20
LDI r8, 52
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
