; DESCRIPTION: Creates a blue rectangular region at (293, 72) spanning 102 by 119 pixels.
; PLAN: r0=293(x), r1=72(y), r2=102(width), r3=119(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 293
LDI r1, 72
LDI r2, 102
LDI r3, 119
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
