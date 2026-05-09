; DESCRIPTION: Composite: Sets a single blue pixel at (261, 217) then Creates a orange rectangular region at (29, 145) spanning 30 by 79 pixels.
; PLAN: r0=261(x), r1=217(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=29(x), r6=145(y), r7=30(width), r8=79(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 261
LDI r1, 217
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 29
LDI r6, 145
LDI r7, 30
LDI r8, 79
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
