; DESCRIPTION: Creates a purple rectangular region at (153, 122) spanning 41 by 48 pixels.
; PLAN: r0=153(x), r1=122(y), r2=41(width), r3=48(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 122
LDI r2, 41
LDI r3, 48
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
