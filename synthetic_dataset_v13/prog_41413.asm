; DESCRIPTION: Creates a red rectangular region at (351, 45) spanning 31 by 96 pixels.
; PLAN: r0=351(x), r1=45(y), r2=31(width), r3=96(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 351
LDI r1, 45
LDI r2, 31
LDI r3, 96
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
