; DESCRIPTION: Composite: Sets a single magenta pixel at (121, 170) then Creates a purple rectangular region at (252, 148) spanning 58 by 95 pixels.
; PLAN: r0=121(x), r1=170(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=252(x), r6=148(y), r7=58(width), r8=95(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 121
LDI r1, 170
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 252
LDI r6, 148
LDI r7, 58
LDI r8, 95
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
