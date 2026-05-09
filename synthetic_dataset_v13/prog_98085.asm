; DESCRIPTION: Creates a green rectangular region at (100, 79) spanning 112 by 89 pixels.
; PLAN: r0=100(x), r1=79(y), r2=112(width), r3=89(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 79
LDI r2, 112
LDI r3, 89
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
