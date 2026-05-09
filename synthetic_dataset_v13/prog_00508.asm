; DESCRIPTION: Creates a green rectangular region at (6, 125) spanning 20 by 118 pixels.
; PLAN: r0=6(x), r1=125(y), r2=20(width), r3=118(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 125
LDI r2, 20
LDI r3, 118
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
