; DESCRIPTION: Creates a red rectangular region at (282, 176) spanning 78 by 34 pixels.
; PLAN: r0=282(x), r1=176(y), r2=78(width), r3=34(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 282
LDI r1, 176
LDI r2, 78
LDI r3, 34
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
