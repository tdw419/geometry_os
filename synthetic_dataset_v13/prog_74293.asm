; DESCRIPTION: Creates a blue rectangular region at (254, 166) spanning 111 by 78 pixels.
; PLAN: r0=254(x), r1=166(y), r2=111(width), r3=78(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 166
LDI r2, 111
LDI r3, 78
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
