; DESCRIPTION: Composite: Sets a single blue pixel at (255, 120) then Creates a cyan rectangular region at (15, 89) spanning 26 by 79 pixels.
; PLAN: r0=255(x), r1=120(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=15(x), r6=89(y), r7=26(width), r8=79(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 255
LDI r1, 120
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 15
LDI r6, 89
LDI r7, 26
LDI r8, 79
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
