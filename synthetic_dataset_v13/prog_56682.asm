; DESCRIPTION: Composite: Places a purple dot at position (466, 64) then Creates a yellow rectangular region at (448, 78) spanning 56 by 83 pixels.
; PLAN: r0=466(x), r1=64(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=448(x), r6=78(y), r7=56(width), r8=83(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 466
LDI r1, 64
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 448
LDI r6, 78
LDI r7, 56
LDI r8, 83
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
