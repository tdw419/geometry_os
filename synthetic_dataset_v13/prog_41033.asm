; DESCRIPTION: Creates a black rectangular region at (96, 58) spanning 80 by 116 pixels.
; PLAN: r0=96(x), r1=58(y), r2=80(width), r3=116(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 58
LDI r2, 80
LDI r3, 116
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
