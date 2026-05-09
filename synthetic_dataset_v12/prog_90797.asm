; DESCRIPTION: Creates a blue rectangular region at (85, 113) spanning 101 by 106 pixels.
; PLAN: r0=85(x), r1=113(y), r2=101(width), r3=106(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 113
LDI r2, 101
LDI r3, 106
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
