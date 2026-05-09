; DESCRIPTION: Creates a blue rectangular region at (377, 15) spanning 114 by 113 pixels.
; PLAN: r0=377(x), r1=15(y), r2=114(width), r3=113(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 377
LDI r1, 15
LDI r2, 114
LDI r3, 113
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
