; DESCRIPTION: Creates a green rectangular region at (302, 77) spanning 13 by 114 pixels.
; PLAN: r0=302(x), r1=77(y), r2=13(width), r3=114(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 302
LDI r1, 77
LDI r2, 13
LDI r3, 114
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
