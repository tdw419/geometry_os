; DESCRIPTION: Creates a purple rectangular region at (134, 159) spanning 69 by 36 pixels.
; PLAN: r0=134(x), r1=159(y), r2=69(width), r3=36(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 159
LDI r2, 69
LDI r3, 36
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
