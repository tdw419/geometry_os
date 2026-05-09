; DESCRIPTION: Creates a green rectangular region at (219, 15) spanning 35 by 32 pixels.
; PLAN: r0=219(x), r1=15(y), r2=35(width), r3=32(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 15
LDI r2, 35
LDI r3, 32
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
