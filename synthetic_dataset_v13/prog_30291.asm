; DESCRIPTION: Creates a blue rectangular region at (381, 232) spanning 92 by 17 pixels.
; PLAN: r0=381(x), r1=232(y), r2=92(width), r3=17(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 381
LDI r1, 232
LDI r2, 92
LDI r3, 17
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
