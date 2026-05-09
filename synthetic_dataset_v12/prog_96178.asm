; DESCRIPTION: Creates a green rectangular region at (244, 60) spanning 44 by 20 pixels.
; PLAN: r0=244(x), r1=60(y), r2=44(width), r3=20(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 60
LDI r2, 44
LDI r3, 20
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
