; DESCRIPTION: Creates a red rectangular region at (122, 78) spanning 111 by 62 pixels.
; PLAN: r0=122(x), r1=78(y), r2=111(width), r3=62(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 78
LDI r2, 111
LDI r3, 62
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
