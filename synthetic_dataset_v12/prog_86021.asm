; DESCRIPTION: Creates a green rectangular region at (96, 78) spanning 115 by 83 pixels.
; PLAN: r0=96(x), r1=78(y), r2=115(width), r3=83(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 78
LDI r2, 115
LDI r3, 83
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
