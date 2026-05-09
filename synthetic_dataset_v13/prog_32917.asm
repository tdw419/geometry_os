; DESCRIPTION: Composite: Sets a single red pixel at (259, 81) then Renders a cyan line between points (20, 35) and (4, 244).
; PLAN: r0=259(x), r1=81(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=20(x1), r6=35(y1), r7=4(x2), r8=244(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 259
LDI r1, 81
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 20
LDI r6, 35
LDI r7, 4
LDI r8, 244
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
