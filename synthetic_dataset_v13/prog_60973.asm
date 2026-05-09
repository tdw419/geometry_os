; DESCRIPTION: Creates a purple rectangular region at (232, 121) spanning 117 by 11 pixels.
; PLAN: r0=232(x), r1=121(y), r2=117(width), r3=11(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 121
LDI r2, 117
LDI r3, 11
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
