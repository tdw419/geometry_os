; DESCRIPTION: Creates a purple rectangular region at (0, 25) spanning 116 by 30 pixels.
; PLAN: r0=0(x), r1=25(y), r2=116(width), r3=30(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 25
LDI r2, 116
LDI r3, 30
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
