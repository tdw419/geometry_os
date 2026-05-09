; DESCRIPTION: Creates a white rectangular region at (97, 67) spanning 106 by 85 pixels.
; PLAN: r0=97(x), r1=67(y), r2=106(width), r3=85(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 67
LDI r2, 106
LDI r3, 85
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
