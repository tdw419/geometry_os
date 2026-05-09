; DESCRIPTION: Creates a green rectangular region at (229, 125) spanning 101 by 78 pixels.
; PLAN: r0=229(x), r1=125(y), r2=101(width), r3=78(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 125
LDI r2, 101
LDI r3, 78
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
