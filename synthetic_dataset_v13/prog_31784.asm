; DESCRIPTION: Creates a purple rectangular region at (158, 33) spanning 108 by 102 pixels.
; PLAN: r0=158(x), r1=33(y), r2=108(width), r3=102(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 33
LDI r2, 108
LDI r3, 102
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
