; DESCRIPTION: Creates a green rectangular region at (483, 105) spanning 14 by 59 pixels.
; PLAN: r0=483(x), r1=105(y), r2=14(width), r3=59(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 483
LDI r1, 105
LDI r2, 14
LDI r3, 59
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
