; DESCRIPTION: Creates a purple rectangular region at (184, 105) spanning 47 by 90 pixels.
; PLAN: r0=184(x), r1=105(y), r2=47(width), r3=90(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 105
LDI r2, 47
LDI r3, 90
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
