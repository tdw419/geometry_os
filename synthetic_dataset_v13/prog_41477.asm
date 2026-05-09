; DESCRIPTION: Creates a blue rectangular region at (223, 113) spanning 100 by 117 pixels.
; PLAN: r0=223(x), r1=113(y), r2=100(width), r3=117(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 113
LDI r2, 100
LDI r3, 117
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
