; DESCRIPTION: Creates a red rectangular region at (155, 18) spanning 44 by 118 pixels.
; PLAN: r0=155(x), r1=18(y), r2=44(width), r3=118(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 18
LDI r2, 44
LDI r3, 118
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
