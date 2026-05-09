; DESCRIPTION: Creates a green rectangular region at (383, 145) spanning 101 by 101 pixels.
; PLAN: r0=383(x), r1=145(y), r2=101(width), r3=101(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 383
LDI r1, 145
LDI r2, 101
LDI r3, 101
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
