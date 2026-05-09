; DESCRIPTION: Creates a blue rectangular region at (377, 35) spanning 66 by 98 pixels.
; PLAN: r0=377(x), r1=35(y), r2=66(width), r3=98(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 377
LDI r1, 35
LDI r2, 66
LDI r3, 98
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
