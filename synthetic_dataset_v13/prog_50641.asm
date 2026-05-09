; DESCRIPTION: Creates a red rectangular region at (238, 206) spanning 78 by 47 pixels.
; PLAN: r0=238(x), r1=206(y), r2=78(width), r3=47(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 238
LDI r1, 206
LDI r2, 78
LDI r3, 47
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
