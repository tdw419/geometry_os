; DESCRIPTION: Creates a green rectangular region at (244, 73) spanning 23 by 60 pixels.
; PLAN: r0=244(x), r1=73(y), r2=23(width), r3=60(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 73
LDI r2, 23
LDI r3, 60
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
