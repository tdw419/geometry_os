; DESCRIPTION: Composite: Places a blue dot at position (153, 87) then Creates a blue rectangular region at (63, 74) spanning 49 by 118 pixels.
; PLAN: r0=153(x), r1=87(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=63(x), r6=74(y), r7=49(width), r8=118(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 153
LDI r1, 87
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 63
LDI r6, 74
LDI r7, 49
LDI r8, 118
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
