; DESCRIPTION: Creates a green rectangular region at (4, 14) spanning 62 by 11 pixels.
; PLAN: r0=4(x), r1=14(y), r2=62(width), r3=11(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 14
LDI r2, 62
LDI r3, 11
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
