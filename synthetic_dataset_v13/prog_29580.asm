; DESCRIPTION: Creates a red rectangular region at (314, 38) spanning 26 by 26 pixels.
; PLAN: r0=314(x), r1=38(y), r2=26(width), r3=26(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 314
LDI r1, 38
LDI r2, 26
LDI r3, 26
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
