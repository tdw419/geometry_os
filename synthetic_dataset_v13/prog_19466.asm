; DESCRIPTION: Creates a orange rectangular region at (311, 122) spanning 93 by 112 pixels.
; PLAN: r0=311(x), r1=122(y), r2=93(width), r3=112(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 311
LDI r1, 122
LDI r2, 93
LDI r3, 112
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
