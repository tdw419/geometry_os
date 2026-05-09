; DESCRIPTION: Creates a black rectangular region at (129, 61) spanning 95 by 118 pixels.
; PLAN: r0=129(x), r1=61(y), r2=95(width), r3=118(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 61
LDI r2, 95
LDI r3, 118
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
