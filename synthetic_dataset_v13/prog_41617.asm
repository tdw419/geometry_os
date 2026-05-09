; DESCRIPTION: Creates a yellow rectangular region at (11, 142) spanning 118 by 90 pixels.
; PLAN: r0=11(x), r1=142(y), r2=118(width), r3=90(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 142
LDI r2, 118
LDI r3, 90
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
