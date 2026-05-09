; DESCRIPTION: Creates a red rectangular region at (381, 45) spanning 19 by 102 pixels.
; PLAN: r0=381(x), r1=45(y), r2=19(width), r3=102(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 381
LDI r1, 45
LDI r2, 19
LDI r3, 102
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
