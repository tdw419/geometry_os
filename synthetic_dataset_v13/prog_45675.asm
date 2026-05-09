; DESCRIPTION: Creates a green rectangular region at (371, 90) spanning 101 by 25 pixels.
; PLAN: r0=371(x), r1=90(y), r2=101(width), r3=25(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 371
LDI r1, 90
LDI r2, 101
LDI r3, 25
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
