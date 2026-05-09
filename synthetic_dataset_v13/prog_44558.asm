; DESCRIPTION: Creates a purple rectangular region at (299, 160) spanning 14 by 83 pixels.
; PLAN: r0=299(x), r1=160(y), r2=14(width), r3=83(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 299
LDI r1, 160
LDI r2, 14
LDI r3, 83
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
