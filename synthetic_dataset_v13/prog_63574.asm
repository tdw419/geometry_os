; DESCRIPTION: Creates a black rectangular region at (337, 116) spanning 14 by 103 pixels.
; PLAN: r0=337(x), r1=116(y), r2=14(width), r3=103(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 337
LDI r1, 116
LDI r2, 14
LDI r3, 103
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
