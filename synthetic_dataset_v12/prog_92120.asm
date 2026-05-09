; DESCRIPTION: Creates a yellow rectangular region at (415, 88) spanning 93 by 73 pixels.
; PLAN: r0=415(x), r1=88(y), r2=93(width), r3=73(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 415
LDI r1, 88
LDI r2, 93
LDI r3, 73
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
