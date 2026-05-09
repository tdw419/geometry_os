; DESCRIPTION: Composite: Sets a single blue pixel at (26, 5) then Creates a purple rectangular region at (225, 148) spanning 64 by 42 pixels.
; PLAN: r0=26(x), r1=5(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=225(x), r6=148(y), r7=64(width), r8=42(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 26
LDI r1, 5
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 225
LDI r6, 148
LDI r7, 64
LDI r8, 42
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
