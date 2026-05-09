; DESCRIPTION: Creates a green rectangular region at (115, 64) spanning 72 by 99 pixels.
; PLAN: r0=115(x), r1=64(y), r2=72(width), r3=99(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 64
LDI r2, 72
LDI r3, 99
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
