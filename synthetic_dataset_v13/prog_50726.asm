; DESCRIPTION: Creates a red rectangular region at (395, 78) spanning 53 by 68 pixels.
; PLAN: r0=395(x), r1=78(y), r2=53(width), r3=68(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 395
LDI r1, 78
LDI r2, 53
LDI r3, 68
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
