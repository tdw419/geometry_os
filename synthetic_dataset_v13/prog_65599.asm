; DESCRIPTION: Creates a purple rectangular region at (238, 113) spanning 43 by 103 pixels.
; PLAN: r0=238(x), r1=113(y), r2=43(width), r3=103(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 238
LDI r1, 113
LDI r2, 43
LDI r3, 103
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
