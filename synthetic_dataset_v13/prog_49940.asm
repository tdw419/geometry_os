; DESCRIPTION: Creates a green rectangular region at (202, 78) spanning 40 by 97 pixels.
; PLAN: r0=202(x), r1=78(y), r2=40(width), r3=97(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 78
LDI r2, 40
LDI r3, 97
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
