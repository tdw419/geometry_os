; DESCRIPTION: Composite: Places a white dot at position (163, 224) then Places a cyan line segment connecting (273, 232) to (47, 138).
; PLAN: r0=163(x), r1=224(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=273(x1), r6=232(y1), r7=47(x2), r8=138(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 163
LDI r1, 224
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 273
LDI r6, 232
LDI r7, 47
LDI r8, 138
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
