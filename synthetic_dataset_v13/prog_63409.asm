; DESCRIPTION: Creates a orange rectangular region at (199, 158) spanning 35 by 98 pixels.
; PLAN: r0=199(x), r1=158(y), r2=35(width), r3=98(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 158
LDI r2, 35
LDI r3, 98
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
