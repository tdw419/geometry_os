; DESCRIPTION: Creates a green rectangular region at (78, 33) spanning 33 by 37 pixels.
; PLAN: r0=78(x), r1=33(y), r2=33(width), r3=37(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 33
LDI r2, 33
LDI r3, 37
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
