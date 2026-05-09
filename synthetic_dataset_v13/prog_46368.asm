; DESCRIPTION: Creates a purple rectangular region at (252, 60) spanning 119 by 74 pixels.
; PLAN: r0=252(x), r1=60(y), r2=119(width), r3=74(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 60
LDI r2, 119
LDI r3, 74
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
