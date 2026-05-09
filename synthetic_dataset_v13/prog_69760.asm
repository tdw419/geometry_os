; DESCRIPTION: Creates a green rectangular region at (88, 122) spanning 12 by 90 pixels.
; PLAN: r0=88(x), r1=122(y), r2=12(width), r3=90(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 122
LDI r2, 12
LDI r3, 90
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
