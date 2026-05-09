; DESCRIPTION: Composite: Places a white line segment connecting (443, 95) to (47, 102) then Places a purple dot at position (12, 19).
; PLAN: r0=443(x1), r1=95(y1), r2=47(x2), r3=102(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=12(x), r6=19(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 443
LDI r1, 95
LDI r2, 47
LDI r3, 102
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 12
LDI r6, 19
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
