; DESCRIPTION: Creates a yellow rectangular region at (377, 17) spanning 77 by 118 pixels.
; PLAN: r0=377(x), r1=17(y), r2=77(width), r3=118(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 377
LDI r1, 17
LDI r2, 77
LDI r3, 118
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
