; DESCRIPTION: Creates a red rectangular region at (231, 123) spanning 78 by 59 pixels.
; PLAN: r0=231(x), r1=123(y), r2=78(width), r3=59(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 123
LDI r2, 78
LDI r3, 59
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
