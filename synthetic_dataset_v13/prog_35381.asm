; DESCRIPTION: Composite: Sets a single blue pixel at (382, 153) then Creates a white rectangular region at (220, 118) spanning 73 by 115 pixels.
; PLAN: r0=382(x), r1=153(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=220(x), r6=118(y), r7=73(width), r8=115(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 382
LDI r1, 153
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 220
LDI r6, 118
LDI r7, 73
LDI r8, 115
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
