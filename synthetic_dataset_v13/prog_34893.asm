; DESCRIPTION: Creates a red rectangular region at (314, 57) spanning 57 by 29 pixels.
; PLAN: r0=314(x), r1=57(y), r2=57(width), r3=29(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 314
LDI r1, 57
LDI r2, 57
LDI r3, 29
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
