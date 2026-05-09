; DESCRIPTION: Composite: Sets a single white pixel at (333, 36) then Renders a magenta line between points (491, 75) and (335, 232).
; PLAN: r0=333(x), r1=36(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=491(x1), r6=75(y1), r7=335(x2), r8=232(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 333
LDI r1, 36
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 491
LDI r6, 75
LDI r7, 335
LDI r8, 232
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
