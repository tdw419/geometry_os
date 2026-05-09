; DESCRIPTION: Creates a green rectangular region at (163, 171) spanning 105 by 63 pixels.
; PLAN: r0=163(x), r1=171(y), r2=105(width), r3=63(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 171
LDI r2, 105
LDI r3, 63
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
