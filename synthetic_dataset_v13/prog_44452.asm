; DESCRIPTION: Composite: Places a white dot at position (41, 210) then Renders a red line between points (246, 91) and (104, 216).
; PLAN: r0=41(x), r1=210(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=246(x1), r6=91(y1), r7=104(x2), r8=216(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 41
LDI r1, 210
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 246
LDI r6, 91
LDI r7, 104
LDI r8, 216
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
