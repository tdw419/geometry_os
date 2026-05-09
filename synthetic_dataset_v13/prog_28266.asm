; DESCRIPTION: Creates a purple rectangular region at (232, 72) spanning 15 by 92 pixels.
; PLAN: r0=232(x), r1=72(y), r2=15(width), r3=92(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 72
LDI r2, 15
LDI r3, 92
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
