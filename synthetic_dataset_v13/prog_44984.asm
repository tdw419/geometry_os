; DESCRIPTION: Creates a blue rectangular region at (389, 12) spanning 98 by 105 pixels.
; PLAN: r0=389(x), r1=12(y), r2=98(width), r3=105(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 389
LDI r1, 12
LDI r2, 98
LDI r3, 105
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
