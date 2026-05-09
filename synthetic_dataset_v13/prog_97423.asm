; DESCRIPTION: Creates a green rectangular region at (99, 132) spanning 30 by 111 pixels.
; PLAN: r0=99(x), r1=132(y), r2=30(width), r3=111(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 132
LDI r2, 30
LDI r3, 111
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
