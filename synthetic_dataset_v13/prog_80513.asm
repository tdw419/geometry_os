; DESCRIPTION: Creates a purple rectangular region at (268, 122) spanning 19 by 59 pixels.
; PLAN: r0=268(x), r1=122(y), r2=19(width), r3=59(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 268
LDI r1, 122
LDI r2, 19
LDI r3, 59
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
