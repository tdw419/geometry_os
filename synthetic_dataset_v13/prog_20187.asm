; DESCRIPTION: Creates a green rectangular region at (30, 80) spanning 22 by 118 pixels.
; PLAN: r0=30(x), r1=80(y), r2=22(width), r3=118(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 80
LDI r2, 22
LDI r3, 118
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
