; DESCRIPTION: Creates a black rectangular region at (233, 120) spanning 116 by 32 pixels.
; PLAN: r0=233(x), r1=120(y), r2=116(width), r3=32(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 120
LDI r2, 116
LDI r3, 32
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
