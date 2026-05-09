; DESCRIPTION: Creates a green rectangular region at (37, 118) spanning 84 by 48 pixels.
; PLAN: r0=37(x), r1=118(y), r2=84(width), r3=48(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 118
LDI r2, 84
LDI r3, 48
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
