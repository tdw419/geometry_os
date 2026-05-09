; DESCRIPTION: Creates a red rectangular region at (353, 47) spanning 53 by 38 pixels.
; PLAN: r0=353(x), r1=47(y), r2=53(width), r3=38(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 353
LDI r1, 47
LDI r2, 53
LDI r3, 38
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
