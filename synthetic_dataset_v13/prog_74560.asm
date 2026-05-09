; DESCRIPTION: Creates a green rectangular region at (389, 131) spanning 118 by 25 pixels.
; PLAN: r0=389(x), r1=131(y), r2=118(width), r3=25(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 389
LDI r1, 131
LDI r2, 118
LDI r3, 25
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
