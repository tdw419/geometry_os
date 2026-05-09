; DESCRIPTION: Creates a yellow rectangular region at (88, 113) spanning 82 by 76 pixels.
; PLAN: r0=88(x), r1=113(y), r2=82(width), r3=76(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 113
LDI r2, 82
LDI r3, 76
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
