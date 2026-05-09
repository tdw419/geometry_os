; DESCRIPTION: Creates a green rectangular region at (32, 105) spanning 109 by 78 pixels.
; PLAN: r0=32(x), r1=105(y), r2=109(width), r3=78(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 105
LDI r2, 109
LDI r3, 78
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
