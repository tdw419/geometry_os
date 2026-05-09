; DESCRIPTION: Creates a red rectangular region at (355, 116) spanning 108 by 62 pixels.
; PLAN: r0=355(x), r1=116(y), r2=108(width), r3=62(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 355
LDI r1, 116
LDI r2, 108
LDI r3, 62
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
