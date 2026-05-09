; DESCRIPTION: Composite: Places a cyan dot at position (291, 241) then Creates a magenta rectangular region at (12, 48) spanning 118 by 105 pixels.
; PLAN: r0=291(x), r1=241(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=12(x), r6=48(y), r7=118(width), r8=105(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 291
LDI r1, 241
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 12
LDI r6, 48
LDI r7, 118
LDI r8, 105
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
