; DESCRIPTION: Composite: Sets a single blue pixel at (102, 144) then Renders a white line between points (18, 224) and (302, 53).
; PLAN: r0=102(x), r1=144(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=18(x1), r6=224(y1), r7=302(x2), r8=53(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 102
LDI r1, 144
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 18
LDI r6, 224
LDI r7, 302
LDI r8, 53
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
