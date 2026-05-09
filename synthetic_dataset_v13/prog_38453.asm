; DESCRIPTION: Creates a green rectangular region at (309, 160) spanning 69 by 56 pixels.
; PLAN: r0=309(x), r1=160(y), r2=69(width), r3=56(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 309
LDI r1, 160
LDI r2, 69
LDI r3, 56
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
