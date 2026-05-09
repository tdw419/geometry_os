; DESCRIPTION: Creates a green rectangular region at (341, 138) spanning 83 by 118 pixels.
; PLAN: r0=341(x), r1=138(y), r2=83(width), r3=118(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 341
LDI r1, 138
LDI r2, 83
LDI r3, 118
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
