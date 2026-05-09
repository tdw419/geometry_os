; DESCRIPTION: Creates a white rectangular region at (429, 122) spanning 81 by 67 pixels.
; PLAN: r0=429(x), r1=122(y), r2=81(width), r3=67(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 429
LDI r1, 122
LDI r2, 81
LDI r3, 67
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
