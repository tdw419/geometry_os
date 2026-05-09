; DESCRIPTION: Creates a black rectangular region at (415, 22) spanning 93 by 116 pixels.
; PLAN: r0=415(x), r1=22(y), r2=93(width), r3=116(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 415
LDI r1, 22
LDI r2, 93
LDI r3, 116
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
