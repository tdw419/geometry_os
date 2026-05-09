; DESCRIPTION: Composite: Sets a single blue pixel at (142, 48) then Renders a cyan line between points (334, 15) and (3, 192).
; PLAN: r0=142(x), r1=48(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=334(x1), r6=15(y1), r7=3(x2), r8=192(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 142
LDI r1, 48
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 334
LDI r6, 15
LDI r7, 3
LDI r8, 192
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
