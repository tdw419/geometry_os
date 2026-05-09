; DESCRIPTION: Creates a purple rectangular region at (122, 158) spanning 10 by 92 pixels.
; PLAN: r0=122(x), r1=158(y), r2=10(width), r3=92(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 158
LDI r2, 10
LDI r3, 92
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
