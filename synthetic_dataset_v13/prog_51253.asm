; DESCRIPTION: Creates a purple rectangular region at (12, 56) spanning 47 by 73 pixels.
; PLAN: r0=12(x), r1=56(y), r2=47(width), r3=73(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 56
LDI r2, 47
LDI r3, 73
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
