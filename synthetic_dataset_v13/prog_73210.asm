; DESCRIPTION: Creates a blue rectangular region at (377, 2) spanning 102 by 83 pixels.
; PLAN: r0=377(x), r1=2(y), r2=102(width), r3=83(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 377
LDI r1, 2
LDI r2, 102
LDI r3, 83
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
