; DESCRIPTION: Creates a green rectangular region at (144, 219) spanning 12 by 24 pixels.
; PLAN: r0=144(x), r1=219(y), r2=12(width), r3=24(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 219
LDI r2, 12
LDI r3, 24
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
