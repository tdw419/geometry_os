; DESCRIPTION: Creates a green rectangular region at (110, 66) spanning 95 by 80 pixels.
; PLAN: r0=110(x), r1=66(y), r2=95(width), r3=80(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 66
LDI r2, 95
LDI r3, 80
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
