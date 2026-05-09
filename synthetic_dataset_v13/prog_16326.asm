; DESCRIPTION: Creates a red rectangular region at (233, 31) spanning 81 by 17 pixels.
; PLAN: r0=233(x), r1=31(y), r2=81(width), r3=17(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 31
LDI r2, 81
LDI r3, 17
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
