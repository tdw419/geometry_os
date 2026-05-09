; DESCRIPTION: Creates a purple rectangular region at (314, 135) spanning 67 by 71 pixels.
; PLAN: r0=314(x), r1=135(y), r2=67(width), r3=71(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 314
LDI r1, 135
LDI r2, 67
LDI r3, 71
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
