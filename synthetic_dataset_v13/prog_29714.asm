; DESCRIPTION: Creates a purple rectangular region at (114, 67) spanning 71 by 38 pixels.
; PLAN: r0=114(x), r1=67(y), r2=71(width), r3=38(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 67
LDI r2, 71
LDI r3, 38
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
