; DESCRIPTION: Composite: Sets a single white pixel at (221, 13) then Renders a red line between points (296, 141) and (463, 13).
; PLAN: r0=221(x), r1=13(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=296(x1), r6=141(y1), r7=463(x2), r8=13(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 221
LDI r1, 13
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 296
LDI r6, 141
LDI r7, 463
LDI r8, 13
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
