; DESCRIPTION: Creates a blue rectangular region at (78, 31) spanning 81 by 85 pixels.
; PLAN: r0=78(x), r1=31(y), r2=81(width), r3=85(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 31
LDI r2, 81
LDI r3, 85
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
