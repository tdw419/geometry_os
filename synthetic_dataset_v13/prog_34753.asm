; DESCRIPTION: Creates a black rectangular region at (334, 20) spanning 101 by 57 pixels.
; PLAN: r0=334(x), r1=20(y), r2=101(width), r3=57(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 20
LDI r2, 101
LDI r3, 57
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
