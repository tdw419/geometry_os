; DESCRIPTION: Creates a blue rectangular region at (377, 111) spanning 118 by 11 pixels.
; PLAN: r0=377(x), r1=111(y), r2=118(width), r3=11(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 377
LDI r1, 111
LDI r2, 118
LDI r3, 11
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
