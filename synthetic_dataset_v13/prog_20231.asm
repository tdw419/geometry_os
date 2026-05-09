; DESCRIPTION: Creates a green rectangular region at (20, 69) spanning 31 by 26 pixels.
; PLAN: r0=20(x), r1=69(y), r2=31(width), r3=26(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 69
LDI r2, 31
LDI r3, 26
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
