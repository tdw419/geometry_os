; DESCRIPTION: Creates a black rectangular region at (18, 81) spanning 61 by 118 pixels.
; PLAN: r0=18(x), r1=81(y), r2=61(width), r3=118(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 81
LDI r2, 61
LDI r3, 118
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
