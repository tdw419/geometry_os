; DESCRIPTION: Creates a purple rectangular region at (238, 58) spanning 89 by 33 pixels.
; PLAN: r0=238(x), r1=58(y), r2=89(width), r3=33(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 238
LDI r1, 58
LDI r2, 89
LDI r3, 33
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
