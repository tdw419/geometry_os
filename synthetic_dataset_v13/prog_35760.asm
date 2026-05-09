; DESCRIPTION: Creates a green rectangular region at (424, 118) spanning 11 by 29 pixels.
; PLAN: r0=424(x), r1=118(y), r2=11(width), r3=29(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 424
LDI r1, 118
LDI r2, 11
LDI r3, 29
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
