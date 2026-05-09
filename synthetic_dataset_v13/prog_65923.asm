; DESCRIPTION: Creates a green rectangular region at (223, 84) spanning 38 by 100 pixels.
; PLAN: r0=223(x), r1=84(y), r2=38(width), r3=100(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 84
LDI r2, 38
LDI r3, 100
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
