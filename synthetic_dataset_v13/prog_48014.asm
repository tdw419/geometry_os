; DESCRIPTION: Creates a purple rectangular region at (76, 113) spanning 38 by 82 pixels.
; PLAN: r0=76(x), r1=113(y), r2=38(width), r3=82(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 113
LDI r2, 38
LDI r3, 82
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
