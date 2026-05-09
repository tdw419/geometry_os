; DESCRIPTION: Composite: Places a yellow dot at position (186, 50) then Places a yellow line segment connecting (387, 41) to (246, 77).
; PLAN: r0=186(x), r1=50(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=387(x1), r6=41(y1), r7=246(x2), r8=77(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 186
LDI r1, 50
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 387
LDI r6, 41
LDI r7, 246
LDI r8, 77
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
