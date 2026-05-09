; DESCRIPTION: Composite: Sets a single blue pixel at (347, 145) then Creates a blue rectangular region at (258, 144) spanning 111 by 16 pixels.
; PLAN: r0=347(x), r1=145(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=258(x), r6=144(y), r7=111(width), r8=16(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 347
LDI r1, 145
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 258
LDI r6, 144
LDI r7, 111
LDI r8, 16
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
