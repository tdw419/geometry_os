; DESCRIPTION: Creates a purple rectangular region at (289, 113) spanning 34 by 54 pixels.
; PLAN: r0=289(x), r1=113(y), r2=34(width), r3=54(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 289
LDI r1, 113
LDI r2, 34
LDI r3, 54
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
