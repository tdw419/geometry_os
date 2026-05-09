; DESCRIPTION: Creates a purple rectangular region at (213, 101) spanning 67 by 91 pixels.
; PLAN: r0=213(x), r1=101(y), r2=67(width), r3=91(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 101
LDI r2, 67
LDI r3, 91
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
