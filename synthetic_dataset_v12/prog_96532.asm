; DESCRIPTION: Creates a green rectangular region at (377, 65) spanning 68 by 118 pixels.
; PLAN: r0=377(x), r1=65(y), r2=68(width), r3=118(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 377
LDI r1, 65
LDI r2, 68
LDI r3, 118
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
