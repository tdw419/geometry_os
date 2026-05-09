; DESCRIPTION: Creates a green rectangular region at (397, 127) spanning 11 by 35 pixels.
; PLAN: r0=397(x), r1=127(y), r2=11(width), r3=35(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 397
LDI r1, 127
LDI r2, 11
LDI r3, 35
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
