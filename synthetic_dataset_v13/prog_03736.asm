; DESCRIPTION: Composite: Sets a single blue pixel at (345, 140) then Creates a yellow rectangular region at (358, 128) spanning 97 by 49 pixels.
; PLAN: r0=345(x), r1=140(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=358(x), r6=128(y), r7=97(width), r8=49(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 345
LDI r1, 140
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 358
LDI r6, 128
LDI r7, 97
LDI r8, 49
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
