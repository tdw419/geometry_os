; DESCRIPTION: Creates a green rectangular region at (124, 32) spanning 106 by 23 pixels.
; PLAN: r0=124(x), r1=32(y), r2=106(width), r3=23(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 32
LDI r2, 106
LDI r3, 23
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
