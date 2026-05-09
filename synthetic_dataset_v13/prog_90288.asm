; DESCRIPTION: Creates a blue rectangular region at (262, 113) spanning 37 by 35 pixels.
; PLAN: r0=262(x), r1=113(y), r2=37(width), r3=35(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 262
LDI r1, 113
LDI r2, 37
LDI r3, 35
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
