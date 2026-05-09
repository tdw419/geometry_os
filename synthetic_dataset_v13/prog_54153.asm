; DESCRIPTION: Creates a purple rectangular region at (256, 105) spanning 24 by 70 pixels.
; PLAN: r0=256(x), r1=105(y), r2=24(width), r3=70(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 256
LDI r1, 105
LDI r2, 24
LDI r3, 70
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
