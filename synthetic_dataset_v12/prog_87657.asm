; DESCRIPTION: Creates a black rectangular region at (100, 14) spanning 87 by 116 pixels.
; PLAN: r0=100(x), r1=14(y), r2=87(width), r3=116(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 14
LDI r2, 87
LDI r3, 116
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
