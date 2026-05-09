; DESCRIPTION: Creates a green rectangular region at (299, 14) spanning 81 by 99 pixels.
; PLAN: r0=299(x), r1=14(y), r2=81(width), r3=99(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 299
LDI r1, 14
LDI r2, 81
LDI r3, 99
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
