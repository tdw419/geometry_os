; DESCRIPTION: Creates a green rectangular region at (244, 111) spanning 26 by 57 pixels.
; PLAN: r0=244(x), r1=111(y), r2=26(width), r3=57(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 111
LDI r2, 26
LDI r3, 57
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
