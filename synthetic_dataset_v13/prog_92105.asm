; DESCRIPTION: Composite: Places a white dot at position (391, 208) then Renders a white line between points (238, 12) and (290, 178).
; PLAN: r0=391(x), r1=208(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=238(x1), r6=12(y1), r7=290(x2), r8=178(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 391
LDI r1, 208
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 238
LDI r6, 12
LDI r7, 290
LDI r8, 178
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
