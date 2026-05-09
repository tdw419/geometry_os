; DESCRIPTION: Creates a purple rectangular region at (217, 121) spanning 114 by 78 pixels.
; PLAN: r0=217(x), r1=121(y), r2=114(width), r3=78(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 121
LDI r2, 114
LDI r3, 78
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
