; DESCRIPTION: Creates a white rectangular region at (308, 90) spanning 49 by 34 pixels.
; PLAN: r0=308(x), r1=90(y), r2=49(width), r3=34(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 308
LDI r1, 90
LDI r2, 49
LDI r3, 34
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
