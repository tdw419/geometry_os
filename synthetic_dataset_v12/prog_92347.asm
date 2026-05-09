; DESCRIPTION: Creates a green rectangular region at (108, 13) spanning 115 by 100 pixels.
; PLAN: r0=108(x), r1=13(y), r2=115(width), r3=100(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 13
LDI r2, 115
LDI r3, 100
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
