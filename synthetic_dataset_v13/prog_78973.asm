; DESCRIPTION: Creates a green rectangular region at (108, 23) spanning 15 by 41 pixels.
; PLAN: r0=108(x), r1=23(y), r2=15(width), r3=41(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 23
LDI r2, 15
LDI r3, 41
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
