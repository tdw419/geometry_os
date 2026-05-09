; DESCRIPTION: Creates a green rectangular region at (309, 57) spanning 28 by 33 pixels.
; PLAN: r0=309(x), r1=57(y), r2=28(width), r3=33(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 309
LDI r1, 57
LDI r2, 28
LDI r3, 33
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
