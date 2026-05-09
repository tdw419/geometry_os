; DESCRIPTION: Creates a blue rectangular region at (312, 183) spanning 105 by 59 pixels.
; PLAN: r0=312(x), r1=183(y), r2=105(width), r3=59(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 312
LDI r1, 183
LDI r2, 105
LDI r3, 59
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
