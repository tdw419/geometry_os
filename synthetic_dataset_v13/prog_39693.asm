; DESCRIPTION: Creates a black rectangular region at (266, 96) spanning 72 by 32 pixels.
; PLAN: r0=266(x), r1=96(y), r2=72(width), r3=32(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 266
LDI r1, 96
LDI r2, 72
LDI r3, 32
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
