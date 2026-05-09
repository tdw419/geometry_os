; DESCRIPTION: Composite: Sets a single white pixel at (405, 156) then Renders a red line between points (291, 223) and (167, 66).
; PLAN: r0=405(x), r1=156(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=291(x1), r6=223(y1), r7=167(x2), r8=66(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 405
LDI r1, 156
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 291
LDI r6, 223
LDI r7, 167
LDI r8, 66
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
