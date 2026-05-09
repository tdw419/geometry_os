; DESCRIPTION: Composite: Sets a single green pixel at (381, 169) then Creates a magenta rectangular region at (115, 34) spanning 34 by 51 pixels.
; PLAN: r0=381(x), r1=169(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=115(x), r6=34(y), r7=34(width), r8=51(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 381
LDI r1, 169
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 115
LDI r6, 34
LDI r7, 34
LDI r8, 51
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
