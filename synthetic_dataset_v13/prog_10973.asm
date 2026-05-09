; DESCRIPTION: Creates a green rectangular region at (326, 155) spanning 10 by 56 pixels.
; PLAN: r0=326(x), r1=155(y), r2=10(width), r3=56(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 326
LDI r1, 155
LDI r2, 10
LDI r3, 56
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
