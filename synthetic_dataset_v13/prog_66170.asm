; DESCRIPTION: Creates a green rectangular region at (329, 66) spanning 66 by 99 pixels.
; PLAN: r0=329(x), r1=66(y), r2=66(width), r3=99(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 329
LDI r1, 66
LDI r2, 66
LDI r3, 99
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
