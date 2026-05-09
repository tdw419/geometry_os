; DESCRIPTION: Creates a purple rectangular region at (96, 113) spanning 85 by 116 pixels.
; PLAN: r0=96(x), r1=113(y), r2=85(width), r3=116(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 113
LDI r2, 85
LDI r3, 116
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
