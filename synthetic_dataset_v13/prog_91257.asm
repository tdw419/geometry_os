; DESCRIPTION: Creates a blue rectangular region at (402, 102) spanning 56 by 102 pixels.
; PLAN: r0=402(x), r1=102(y), r2=56(width), r3=102(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 402
LDI r1, 102
LDI r2, 56
LDI r3, 102
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
