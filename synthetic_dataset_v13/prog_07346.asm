; DESCRIPTION: Creates a purple rectangular region at (325, 171) spanning 105 by 22 pixels.
; PLAN: r0=325(x), r1=171(y), r2=105(width), r3=22(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 325
LDI r1, 171
LDI r2, 105
LDI r3, 22
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
