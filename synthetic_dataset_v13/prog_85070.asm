; DESCRIPTION: Creates a blue rectangular region at (11, 203) spanning 77 by 43 pixels.
; PLAN: r0=11(x), r1=203(y), r2=77(width), r3=43(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 203
LDI r2, 77
LDI r3, 43
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
