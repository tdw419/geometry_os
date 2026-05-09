; DESCRIPTION: Creates a orange rectangular region at (238, 62) spanning 40 by 118 pixels.
; PLAN: r0=238(x), r1=62(y), r2=40(width), r3=118(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 238
LDI r1, 62
LDI r2, 40
LDI r3, 118
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
