; DESCRIPTION: Composite: Sets a single green pixel at (48, 178) then Creates a magenta rectangular region at (351, 39) spanning 23 by 54 pixels.
; PLAN: r0=48(x), r1=178(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=351(x), r6=39(y), r7=23(width), r8=54(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 48
LDI r1, 178
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 351
LDI r6, 39
LDI r7, 23
LDI r8, 54
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
