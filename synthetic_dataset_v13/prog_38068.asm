; DESCRIPTION: Composite: Sets a single white pixel at (29, 146) then Draws a green line from (324, 26) to (503, 202).
; PLAN: r0=29(x), r1=146(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=324(x1), r6=26(y1), r7=503(x2), r8=202(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 29
LDI r1, 146
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 324
LDI r6, 26
LDI r7, 503
LDI r8, 202
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
