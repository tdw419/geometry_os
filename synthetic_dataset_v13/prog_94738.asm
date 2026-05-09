; DESCRIPTION: Creates a blue rectangular region at (13, 85) spanning 19 by 105 pixels.
; PLAN: r0=13(x), r1=85(y), r2=19(width), r3=105(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 85
LDI r2, 19
LDI r3, 105
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
