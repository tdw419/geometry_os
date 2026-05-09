; DESCRIPTION: Composite: Places a purple dot at position (236, 238) then Creates a purple rectangular region at (7, 117) spanning 69 by 69 pixels.
; PLAN: r0=236(x), r1=238(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=7(x), r6=117(y), r7=69(width), r8=69(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 236
LDI r1, 238
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 7
LDI r6, 117
LDI r7, 69
LDI r8, 69
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
