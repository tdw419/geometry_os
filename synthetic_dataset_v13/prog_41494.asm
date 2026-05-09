; DESCRIPTION: Creates a green rectangular region at (161, 172) spanning 66 by 24 pixels.
; PLAN: r0=161(x), r1=172(y), r2=66(width), r3=24(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 172
LDI r2, 66
LDI r3, 24
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
