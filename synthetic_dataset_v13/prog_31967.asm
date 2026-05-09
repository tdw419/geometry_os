; DESCRIPTION: Creates a purple rectangular region at (183, 101) spanning 43 by 105 pixels.
; PLAN: r0=183(x), r1=101(y), r2=43(width), r3=105(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 101
LDI r2, 43
LDI r3, 105
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
