; DESCRIPTION: Composite: Sets a single white pixel at (189, 242) then Draws a red line from (103, 111) to (429, 83).
; PLAN: r0=189(x), r1=242(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=103(x1), r6=111(y1), r7=429(x2), r8=83(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 189
LDI r1, 242
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 103
LDI r6, 111
LDI r7, 429
LDI r8, 83
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
