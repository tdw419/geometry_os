; DESCRIPTION: Composite: Renders a red box of size 13x89 starting at (143, 147) then Renders a white line between points (378, 142) and (379, 61).
; PLAN: r0=143(x), r1=147(y), r2=13(width), r3=89(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=378(x1), r6=142(y1), r7=379(x2), r8=61(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 143
LDI r1, 147
LDI r2, 13
LDI r3, 89
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 378
LDI r6, 142
LDI r7, 379
LDI r8, 61
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
