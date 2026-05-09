; DESCRIPTION: Creates a green rectangular region at (96, 37) spanning 11 by 85 pixels.
; PLAN: r0=96(x), r1=37(y), r2=11(width), r3=85(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 37
LDI r2, 11
LDI r3, 85
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
