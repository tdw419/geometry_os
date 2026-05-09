; DESCRIPTION: Composite: Places a red dot at position (297, 181) then Creates a magenta rectangular region at (297, 37) spanning 118 by 102 pixels.
; PLAN: r0=297(x), r1=181(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=297(x), r6=37(y), r7=118(width), r8=102(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 297
LDI r1, 181
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 297
LDI r6, 37
LDI r7, 118
LDI r8, 102
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
