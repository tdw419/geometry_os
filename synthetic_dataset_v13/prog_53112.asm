; DESCRIPTION: Composite: Creates a purple rectangular region at (401, 1) spanning 31 by 68 pixels then Places a red dot at position (280, 69).
; PLAN: r0=401(x), r1=1(y), r2=31(width), r3=68(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=280(x), r6=69(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 401
LDI r1, 1
LDI r2, 31
LDI r3, 68
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 280
LDI r6, 69
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
