; DESCRIPTION: Creates a red rectangular region at (93, 135) spanning 67 by 108 pixels.
; PLAN: r0=93(x), r1=135(y), r2=67(width), r3=108(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 135
LDI r2, 67
LDI r3, 108
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
