; DESCRIPTION: Composite: Sets a single blue pixel at (160, 105) then Creates a magenta rectangular region at (190, 123) spanning 109 by 84 pixels.
; PLAN: r0=160(x), r1=105(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=190(x), r6=123(y), r7=109(width), r8=84(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 160
LDI r1, 105
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 190
LDI r6, 123
LDI r7, 109
LDI r8, 84
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
