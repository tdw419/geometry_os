; DESCRIPTION: Creates a black rectangular region at (158, 124) spanning 96 by 101 pixels.
; PLAN: r0=158(x), r1=124(y), r2=96(width), r3=101(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 124
LDI r2, 96
LDI r3, 101
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
