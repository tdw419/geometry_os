; DESCRIPTION: Composite: Sets a single white pixel at (244, 62) then Renders a red line between points (78, 107) and (486, 228).
; PLAN: r0=244(x), r1=62(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=78(x1), r6=107(y1), r7=486(x2), r8=228(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 244
LDI r1, 62
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 78
LDI r6, 107
LDI r7, 486
LDI r8, 228
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
