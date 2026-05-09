; DESCRIPTION: Composite: Sets a single red pixel at (76, 6) then Creates a blue rectangular region at (447, 125) spanning 44 by 66 pixels.
; PLAN: r0=76(x), r1=6(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=447(x), r6=125(y), r7=44(width), r8=66(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 76
LDI r1, 6
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 447
LDI r6, 125
LDI r7, 44
LDI r8, 66
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
