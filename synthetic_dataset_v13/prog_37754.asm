; DESCRIPTION: Creates a black rectangular region at (142, 37) spanning 116 by 64 pixels.
; PLAN: r0=142(x), r1=37(y), r2=116(width), r3=64(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 37
LDI r2, 116
LDI r3, 64
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
