; DESCRIPTION: Creates a green rectangular region at (38, 105) spanning 55 by 73 pixels.
; PLAN: r0=38(x), r1=105(y), r2=55(width), r3=73(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 105
LDI r2, 55
LDI r3, 73
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
