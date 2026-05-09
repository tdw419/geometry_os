; DESCRIPTION: Composite: Places a yellow dot at position (121, 156) then Creates a blue rectangular region at (348, 147) spanning 30 by 84 pixels.
; PLAN: r0=121(x), r1=156(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=348(x), r6=147(y), r7=30(width), r8=84(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 121
LDI r1, 156
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 348
LDI r6, 147
LDI r7, 30
LDI r8, 84
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
