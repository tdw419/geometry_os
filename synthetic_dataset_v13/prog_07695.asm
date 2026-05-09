; DESCRIPTION: Composite: Sets a single yellow pixel at (182, 120) then Renders a green line between points (86, 211) and (129, 153).
; PLAN: r0=182(x), r1=120(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=86(x1), r6=211(y1), r7=129(x2), r8=153(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 182
LDI r1, 120
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 86
LDI r6, 211
LDI r7, 129
LDI r8, 153
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
