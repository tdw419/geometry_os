; DESCRIPTION: Composite: Sets a single white pixel at (61, 38) then Renders a white line between points (73, 128) and (157, 183).
; PLAN: r0=61(x), r1=38(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=73(x1), r6=128(y1), r7=157(x2), r8=183(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 61
LDI r1, 38
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 73
LDI r6, 128
LDI r7, 157
LDI r8, 183
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
