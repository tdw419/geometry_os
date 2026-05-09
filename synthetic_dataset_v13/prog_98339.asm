; DESCRIPTION: Creates a white rectangular region at (413, 85) spanning 12 by 60 pixels.
; PLAN: r0=413(x), r1=85(y), r2=12(width), r3=60(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 413
LDI r1, 85
LDI r2, 12
LDI r3, 60
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
