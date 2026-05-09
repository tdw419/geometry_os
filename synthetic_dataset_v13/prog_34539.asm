; DESCRIPTION: Creates a green rectangular region at (99, 7) spanning 71 by 97 pixels.
; PLAN: r0=99(x), r1=7(y), r2=71(width), r3=97(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 7
LDI r2, 71
LDI r3, 97
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
