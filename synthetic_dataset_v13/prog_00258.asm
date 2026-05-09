; DESCRIPTION: Composite: Sets a single white pixel at (44, 33) then Places a purple line segment connecting (452, 150) to (281, 239).
; PLAN: r0=44(x), r1=33(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=452(x1), r6=150(y1), r7=281(x2), r8=239(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 44
LDI r1, 33
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 452
LDI r6, 150
LDI r7, 281
LDI r8, 239
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
