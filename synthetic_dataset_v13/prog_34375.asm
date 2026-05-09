; DESCRIPTION: Creates a purple rectangular region at (360, 151) spanning 19 by 102 pixels.
; PLAN: r0=360(x), r1=151(y), r2=19(width), r3=102(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 360
LDI r1, 151
LDI r2, 19
LDI r3, 102
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
