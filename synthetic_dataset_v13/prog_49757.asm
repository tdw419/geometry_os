; DESCRIPTION: Creates a green rectangular region at (84, 61) spanning 40 by 41 pixels.
; PLAN: r0=84(x), r1=61(y), r2=40(width), r3=41(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 61
LDI r2, 40
LDI r3, 41
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
