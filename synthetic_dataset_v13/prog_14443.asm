; DESCRIPTION: Creates a purple rectangular region at (67, 83) spanning 77 by 107 pixels.
; PLAN: r0=67(x), r1=83(y), r2=77(width), r3=107(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 83
LDI r2, 77
LDI r3, 107
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
