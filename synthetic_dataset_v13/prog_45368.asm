; DESCRIPTION: Creates a purple rectangular region at (336, 118) spanning 59 by 67 pixels.
; PLAN: r0=336(x), r1=118(y), r2=59(width), r3=67(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 336
LDI r1, 118
LDI r2, 59
LDI r3, 67
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
