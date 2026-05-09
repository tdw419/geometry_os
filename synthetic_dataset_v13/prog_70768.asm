; DESCRIPTION: Creates a green rectangular region at (180, 81) spanning 118 by 106 pixels.
; PLAN: r0=180(x), r1=81(y), r2=118(width), r3=106(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 81
LDI r2, 118
LDI r3, 106
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
