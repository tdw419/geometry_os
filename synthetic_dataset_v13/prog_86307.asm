; DESCRIPTION: Creates a green rectangular region at (244, 26) spanning 61 by 54 pixels.
; PLAN: r0=244(x), r1=26(y), r2=61(width), r3=54(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 26
LDI r2, 61
LDI r3, 54
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
