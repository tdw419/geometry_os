; DESCRIPTION: Creates a green rectangular region at (192, 27) spanning 119 by 58 pixels.
; PLAN: r0=192(x), r1=27(y), r2=119(width), r3=58(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 27
LDI r2, 119
LDI r3, 58
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
