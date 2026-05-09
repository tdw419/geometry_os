; DESCRIPTION: Creates a blue rectangular region at (343, 219) spanning 111 by 31 pixels.
; PLAN: r0=343(x), r1=219(y), r2=111(width), r3=31(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 343
LDI r1, 219
LDI r2, 111
LDI r3, 31
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
