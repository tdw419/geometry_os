; DESCRIPTION: Creates a black rectangular region at (93, 88) spanning 47 by 52 pixels.
; PLAN: r0=93(x), r1=88(y), r2=47(width), r3=52(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 88
LDI r2, 47
LDI r3, 52
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
