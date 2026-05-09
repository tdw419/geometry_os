; DESCRIPTION: Creates a green rectangular region at (366, 10) spanning 100 by 38 pixels.
; PLAN: r0=366(x), r1=10(y), r2=100(width), r3=38(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 366
LDI r1, 10
LDI r2, 100
LDI r3, 38
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
