; DESCRIPTION: Creates a purple rectangular region at (432, 135) spanning 39 by 53 pixels.
; PLAN: r0=432(x), r1=135(y), r2=39(width), r3=53(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 432
LDI r1, 135
LDI r2, 39
LDI r3, 53
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
