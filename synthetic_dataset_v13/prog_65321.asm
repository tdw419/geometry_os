; DESCRIPTION: Creates a purple rectangular region at (1, 116) spanning 86 by 86 pixels.
; PLAN: r0=1(x), r1=116(y), r2=86(width), r3=86(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 116
LDI r2, 86
LDI r3, 86
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
