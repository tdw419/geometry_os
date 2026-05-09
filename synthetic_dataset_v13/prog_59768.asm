; DESCRIPTION: Creates a green rectangular region at (491, 70) spanning 14 by 89 pixels.
; PLAN: r0=491(x), r1=70(y), r2=14(width), r3=89(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 491
LDI r1, 70
LDI r2, 14
LDI r3, 89
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
