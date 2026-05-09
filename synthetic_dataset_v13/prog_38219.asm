; DESCRIPTION: Creates a black rectangular region at (399, 116) spanning 49 by 30 pixels.
; PLAN: r0=399(x), r1=116(y), r2=49(width), r3=30(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 399
LDI r1, 116
LDI r2, 49
LDI r3, 30
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
