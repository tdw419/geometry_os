; DESCRIPTION: Composite: Sets a single green pixel at (68, 104) then Creates a blue rectangular region at (201, 39) spanning 92 by 79 pixels.
; PLAN: r0=68(x), r1=104(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=201(x), r6=39(y), r7=92(width), r8=79(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 68
LDI r1, 104
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 201
LDI r6, 39
LDI r7, 92
LDI r8, 79
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
