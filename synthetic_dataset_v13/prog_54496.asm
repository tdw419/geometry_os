; DESCRIPTION: Creates a green rectangular region at (245, 83) spanning 25 by 101 pixels.
; PLAN: r0=245(x), r1=83(y), r2=25(width), r3=101(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 83
LDI r2, 25
LDI r3, 101
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
