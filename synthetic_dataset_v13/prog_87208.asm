; DESCRIPTION: Creates a blue rectangular region at (56, 77) spanning 28 by 19 pixels.
; PLAN: r0=56(x), r1=77(y), r2=28(width), r3=19(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 77
LDI r2, 28
LDI r3, 19
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
