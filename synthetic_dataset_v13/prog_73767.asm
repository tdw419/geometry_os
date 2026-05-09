; DESCRIPTION: Composite: Places a white dot at position (5, 165) then Places a purple line segment connecting (303, 116) to (511, 218).
; PLAN: r0=5(x), r1=165(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=303(x1), r6=116(y1), r7=511(x2), r8=218(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 5
LDI r1, 165
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 303
LDI r6, 116
LDI r7, 511
LDI r8, 218
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
