; DESCRIPTION: Creates a blue rectangular region at (161, 84) spanning 111 by 52 pixels.
; PLAN: r0=161(x), r1=84(y), r2=111(width), r3=52(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 84
LDI r2, 111
LDI r3, 52
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
