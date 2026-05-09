; DESCRIPTION: Creates a yellow rectangular region at (93, 88) spanning 12 by 77 pixels.
; PLAN: r0=93(x), r1=88(y), r2=12(width), r3=77(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 88
LDI r2, 12
LDI r3, 77
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
