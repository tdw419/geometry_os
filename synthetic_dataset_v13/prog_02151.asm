; DESCRIPTION: Composite: Places a purple dot at position (6, 117) then Renders a white line between points (19, 191) and (314, 246).
; PLAN: r0=6(x), r1=117(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=19(x1), r6=191(y1), r7=314(x2), r8=246(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 6
LDI r1, 117
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 19
LDI r6, 191
LDI r7, 314
LDI r8, 246
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
