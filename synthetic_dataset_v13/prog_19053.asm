; DESCRIPTION: Creates a green rectangular region at (40, 11) spanning 24 by 99 pixels.
; PLAN: r0=40(x), r1=11(y), r2=24(width), r3=99(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 11
LDI r2, 24
LDI r3, 99
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
