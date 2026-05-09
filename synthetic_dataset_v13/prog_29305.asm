; DESCRIPTION: Creates a black rectangular region at (4, 85) spanning 118 by 112 pixels.
; PLAN: r0=4(x), r1=85(y), r2=118(width), r3=112(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 85
LDI r2, 118
LDI r3, 112
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
