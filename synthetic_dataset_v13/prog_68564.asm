; DESCRIPTION: Creates a black rectangular region at (361, 77) spanning 52 by 118 pixels.
; PLAN: r0=361(x), r1=77(y), r2=52(width), r3=118(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 77
LDI r2, 52
LDI r3, 118
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
