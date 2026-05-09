; DESCRIPTION: Composite: Sets a single yellow pixel at (473, 81) then Places a white line segment connecting (410, 163) to (471, 253).
; PLAN: r0=473(x), r1=81(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=410(x1), r6=163(y1), r7=471(x2), r8=253(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 473
LDI r1, 81
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 410
LDI r6, 163
LDI r7, 471
LDI r8, 253
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
