; DESCRIPTION: Creates a purple rectangular region at (76, 50) spanning 102 by 57 pixels.
; PLAN: r0=76(x), r1=50(y), r2=102(width), r3=57(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 50
LDI r2, 102
LDI r3, 57
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
