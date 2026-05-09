; DESCRIPTION: Composite: Sets a single white pixel at (361, 173) then Places a purple line segment connecting (217, 210) to (82, 147).
; PLAN: r0=361(x), r1=173(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=217(x1), r6=210(y1), r7=82(x2), r8=147(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 361
LDI r1, 173
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 217
LDI r6, 210
LDI r7, 82
LDI r8, 147
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
