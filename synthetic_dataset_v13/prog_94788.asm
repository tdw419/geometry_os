; DESCRIPTION: Composite: Places a cyan dot at position (413, 78) then Places a white line segment connecting (176, 102) to (395, 156).
; PLAN: r0=413(x), r1=78(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=176(x1), r6=102(y1), r7=395(x2), r8=156(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 413
LDI r1, 78
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 176
LDI r6, 102
LDI r7, 395
LDI r8, 156
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
