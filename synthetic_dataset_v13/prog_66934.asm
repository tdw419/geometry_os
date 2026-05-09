; DESCRIPTION: Creates a purple rectangular region at (324, 102) spanning 107 by 88 pixels.
; PLAN: r0=324(x), r1=102(y), r2=107(width), r3=88(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 324
LDI r1, 102
LDI r2, 107
LDI r3, 88
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
