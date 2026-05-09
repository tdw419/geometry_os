; DESCRIPTION: Creates a red rectangular region at (314, 31) spanning 14 by 60 pixels.
; PLAN: r0=314(x), r1=31(y), r2=14(width), r3=60(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 314
LDI r1, 31
LDI r2, 14
LDI r3, 60
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
