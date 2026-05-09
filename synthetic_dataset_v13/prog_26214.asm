; DESCRIPTION: Creates a white rectangular region at (303, 102) spanning 61 by 85 pixels.
; PLAN: r0=303(x), r1=102(y), r2=61(width), r3=85(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 303
LDI r1, 102
LDI r2, 61
LDI r3, 85
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
