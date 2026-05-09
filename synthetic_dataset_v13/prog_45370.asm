; DESCRIPTION: Creates a green rectangular region at (184, 44) spanning 49 by 34 pixels.
; PLAN: r0=184(x), r1=44(y), r2=49(width), r3=34(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 44
LDI r2, 49
LDI r3, 34
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
