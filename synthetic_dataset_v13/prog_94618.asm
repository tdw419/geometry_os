; DESCRIPTION: Creates a purple rectangular region at (29, 21) spanning 105 by 116 pixels.
; PLAN: r0=29(x), r1=21(y), r2=105(width), r3=116(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 21
LDI r2, 105
LDI r3, 116
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
