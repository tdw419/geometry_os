; DESCRIPTION: Creates a white rectangular region at (363, 167) spanning 69 by 14 pixels.
; PLAN: r0=363(x), r1=167(y), r2=69(width), r3=14(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 363
LDI r1, 167
LDI r2, 69
LDI r3, 14
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
