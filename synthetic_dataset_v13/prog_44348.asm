; DESCRIPTION: Creates a green rectangular region at (6, 188) spanning 110 by 10 pixels.
; PLAN: r0=6(x), r1=188(y), r2=110(width), r3=10(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 188
LDI r2, 110
LDI r3, 10
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
