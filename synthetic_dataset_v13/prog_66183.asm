; DESCRIPTION: Creates a purple rectangular region at (105, 21) spanning 116 by 57 pixels.
; PLAN: r0=105(x), r1=21(y), r2=116(width), r3=57(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 21
LDI r2, 116
LDI r3, 57
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
