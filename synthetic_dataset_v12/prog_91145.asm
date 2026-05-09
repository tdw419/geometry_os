; DESCRIPTION: Creates a green rectangular region at (80, 16) spanning 34 by 15 pixels.
; PLAN: r0=80(x), r1=16(y), r2=34(width), r3=15(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 16
LDI r2, 34
LDI r3, 15
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
