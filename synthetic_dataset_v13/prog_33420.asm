; DESCRIPTION: Composite: Sets a single purple pixel at (264, 16) then Renders a red line between points (127, 97) and (48, 158).
; PLAN: r0=264(x), r1=16(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=127(x1), r6=97(y1), r7=48(x2), r8=158(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 264
LDI r1, 16
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 127
LDI r6, 97
LDI r7, 48
LDI r8, 158
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
