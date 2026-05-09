; DESCRIPTION: Creates a green rectangular region at (359, 132) spanning 72 by 96 pixels.
; PLAN: r0=359(x), r1=132(y), r2=72(width), r3=96(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 359
LDI r1, 132
LDI r2, 72
LDI r3, 96
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
