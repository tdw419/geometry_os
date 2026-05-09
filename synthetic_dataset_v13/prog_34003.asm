; DESCRIPTION: Creates a red rectangular region at (199, 62) spanning 38 by 88 pixels.
; PLAN: r0=199(x), r1=62(y), r2=38(width), r3=88(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 62
LDI r2, 38
LDI r3, 88
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
