; DESCRIPTION: Creates a purple rectangular region at (349, 227) spanning 49 by 16 pixels.
; PLAN: r0=349(x), r1=227(y), r2=49(width), r3=16(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 349
LDI r1, 227
LDI r2, 49
LDI r3, 16
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
