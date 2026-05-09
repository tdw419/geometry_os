; DESCRIPTION: Composite: Places a purple dot at position (277, 175) then Places a purple line segment connecting (10, 165) to (429, 82).
; PLAN: r0=277(x), r1=175(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=10(x1), r6=165(y1), r7=429(x2), r8=82(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 277
LDI r1, 175
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 10
LDI r6, 165
LDI r7, 429
LDI r8, 82
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
