; DESCRIPTION: Composite: Places a yellow dot at position (71, 236) then Places a red line segment connecting (112, 183) to (230, 61).
; PLAN: r0=71(x), r1=236(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=112(x1), r6=183(y1), r7=230(x2), r8=61(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 71
LDI r1, 236
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 112
LDI r6, 183
LDI r7, 230
LDI r8, 61
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
