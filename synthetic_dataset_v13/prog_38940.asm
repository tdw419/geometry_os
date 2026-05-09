; DESCRIPTION: Creates a black rectangular region at (141, 81) spanning 102 by 64 pixels.
; PLAN: r0=141(x), r1=81(y), r2=102(width), r3=64(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 81
LDI r2, 102
LDI r3, 64
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
