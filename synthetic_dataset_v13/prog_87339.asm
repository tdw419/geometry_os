; DESCRIPTION: Creates a black rectangular region at (192, 76) spanning 25 by 116 pixels.
; PLAN: r0=192(x), r1=76(y), r2=25(width), r3=116(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 76
LDI r2, 25
LDI r3, 116
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
