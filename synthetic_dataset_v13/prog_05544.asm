; DESCRIPTION: Creates a green rectangular region at (155, 3) spanning 65 by 69 pixels.
; PLAN: r0=155(x), r1=3(y), r2=65(width), r3=69(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 3
LDI r2, 65
LDI r3, 69
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
