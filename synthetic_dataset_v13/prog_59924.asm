; DESCRIPTION: Creates a green rectangular region at (356, 149) spanning 24 by 76 pixels.
; PLAN: r0=356(x), r1=149(y), r2=24(width), r3=76(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 356
LDI r1, 149
LDI r2, 24
LDI r3, 76
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
