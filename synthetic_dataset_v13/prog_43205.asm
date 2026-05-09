; DESCRIPTION: Creates a green rectangular region at (167, 201) spanning 108 by 24 pixels.
; PLAN: r0=167(x), r1=201(y), r2=108(width), r3=24(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 201
LDI r2, 108
LDI r3, 24
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
