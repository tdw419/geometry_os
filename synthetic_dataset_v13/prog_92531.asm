; DESCRIPTION: Creates a green rectangular region at (149, 172) spanning 90 by 13 pixels.
; PLAN: r0=149(x), r1=172(y), r2=90(width), r3=13(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 172
LDI r2, 90
LDI r3, 13
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
