; DESCRIPTION: Creates a green rectangular region at (331, 238) spanning 99 by 16 pixels.
; PLAN: r0=331(x), r1=238(y), r2=99(width), r3=16(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 331
LDI r1, 238
LDI r2, 99
LDI r3, 16
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
