; DESCRIPTION: Creates a black rectangular region at (229, 77) spanning 29 by 118 pixels.
; PLAN: r0=229(x), r1=77(y), r2=29(width), r3=118(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 77
LDI r2, 29
LDI r3, 118
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
