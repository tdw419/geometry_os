; DESCRIPTION: Composite: Sets a single cyan pixel at (106, 188) then Creates a magenta rectangular region at (67, 58) spanning 90 by 104 pixels.
; PLAN: r0=106(x), r1=188(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=67(x), r6=58(y), r7=90(width), r8=104(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 106
LDI r1, 188
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 67
LDI r6, 58
LDI r7, 90
LDI r8, 104
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
