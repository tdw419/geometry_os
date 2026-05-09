; DESCRIPTION: Composite: Sets a single white pixel at (39, 161) then Places a purple line segment connecting (159, 241) to (263, 176).
; PLAN: r0=39(x), r1=161(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=159(x1), r6=241(y1), r7=263(x2), r8=176(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 39
LDI r1, 161
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 159
LDI r6, 241
LDI r7, 263
LDI r8, 176
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
