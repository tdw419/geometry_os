; DESCRIPTION: Creates a green rectangular region at (388, 125) spanning 119 by 14 pixels.
; PLAN: r0=388(x), r1=125(y), r2=119(width), r3=14(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 388
LDI r1, 125
LDI r2, 119
LDI r3, 14
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
