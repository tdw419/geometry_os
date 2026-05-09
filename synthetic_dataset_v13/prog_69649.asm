; DESCRIPTION: Creates a blue rectangular region at (203, 77) spanning 111 by 72 pixels.
; PLAN: r0=203(x), r1=77(y), r2=111(width), r3=72(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 77
LDI r2, 111
LDI r3, 72
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
