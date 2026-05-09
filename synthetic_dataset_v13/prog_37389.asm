; DESCRIPTION: Creates a white rectangular region at (414, 217) spanning 70 by 15 pixels.
; PLAN: r0=414(x), r1=217(y), r2=70(width), r3=15(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 414
LDI r1, 217
LDI r2, 70
LDI r3, 15
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
