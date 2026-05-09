; DESCRIPTION: Creates a white rectangular region at (351, 92) spanning 120 by 66 pixels.
; PLAN: r0=351(x), r1=92(y), r2=120(width), r3=66(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 351
LDI r1, 92
LDI r2, 120
LDI r3, 66
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
