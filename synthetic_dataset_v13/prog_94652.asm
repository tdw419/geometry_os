; DESCRIPTION: Creates a green rectangular region at (231, 23) spanning 111 by 97 pixels.
; PLAN: r0=231(x), r1=23(y), r2=111(width), r3=97(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 23
LDI r2, 111
LDI r3, 97
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
