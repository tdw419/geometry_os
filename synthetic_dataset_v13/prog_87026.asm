; DESCRIPTION: Composite: Sets a single red pixel at (274, 80) then Places a green 77x73 rectangle at position (368, 147).
; PLAN: r0=274(x), r1=80(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=368(x), r6=147(y), r7=77(width), r8=73(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 274
LDI r1, 80
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 368
LDI r6, 147
LDI r7, 77
LDI r8, 73
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
