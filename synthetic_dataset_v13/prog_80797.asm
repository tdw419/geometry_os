; DESCRIPTION: Creates a black rectangular region at (233, 167) spanning 81 by 38 pixels.
; PLAN: r0=233(x), r1=167(y), r2=81(width), r3=38(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 167
LDI r2, 81
LDI r3, 38
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
