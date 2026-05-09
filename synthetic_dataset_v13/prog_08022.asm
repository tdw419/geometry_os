; DESCRIPTION: Creates a green rectangular region at (309, 29) spanning 13 by 80 pixels.
; PLAN: r0=309(x), r1=29(y), r2=13(width), r3=80(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 309
LDI r1, 29
LDI r2, 13
LDI r3, 80
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
