; DESCRIPTION: Creates a green rectangular region at (326, 122) spanning 56 by 112 pixels.
; PLAN: r0=326(x), r1=122(y), r2=56(width), r3=112(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 326
LDI r1, 122
LDI r2, 56
LDI r3, 112
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
