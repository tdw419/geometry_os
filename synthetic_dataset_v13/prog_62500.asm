; DESCRIPTION: Creates a purple rectangular region at (360, 57) spanning 72 by 84 pixels.
; PLAN: r0=360(x), r1=57(y), r2=72(width), r3=84(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 360
LDI r1, 57
LDI r2, 72
LDI r3, 84
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
