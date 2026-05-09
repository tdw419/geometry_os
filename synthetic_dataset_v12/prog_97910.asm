; DESCRIPTION: Creates a green rectangular region at (38, 192) spanning 23 by 23 pixels.
; PLAN: r0=38(x), r1=192(y), r2=23(width), r3=23(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 192
LDI r2, 23
LDI r3, 23
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
