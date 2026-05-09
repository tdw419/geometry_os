; DESCRIPTION: Creates a purple rectangular region at (68, 67) spanning 35 by 94 pixels.
; PLAN: r0=68(x), r1=67(y), r2=35(width), r3=94(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 67
LDI r2, 35
LDI r3, 94
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
