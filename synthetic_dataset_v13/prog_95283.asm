; DESCRIPTION: Composite: Sets a single green pixel at (44, 78) then Renders a red line between points (0, 223) and (121, 73).
; PLAN: r0=44(x), r1=78(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=0(x1), r6=223(y1), r7=121(x2), r8=73(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 44
LDI r1, 78
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 0
LDI r6, 223
LDI r7, 121
LDI r8, 73
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
