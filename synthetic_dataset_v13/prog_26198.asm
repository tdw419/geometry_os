; DESCRIPTION: Composite: Places a white dot at position (137, 145) then Creates a magenta rectangular region at (114, 101) spanning 50 by 102 pixels.
; PLAN: r0=137(x), r1=145(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=114(x), r6=101(y), r7=50(width), r8=102(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 137
LDI r1, 145
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 114
LDI r6, 101
LDI r7, 50
LDI r8, 102
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
