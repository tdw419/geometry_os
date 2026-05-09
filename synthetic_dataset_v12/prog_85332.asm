; DESCRIPTION: Creates a blue rectangular region at (110, 93) spanning 114 by 118 pixels.
; PLAN: r0=110(x), r1=93(y), r2=114(width), r3=118(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 93
LDI r2, 114
LDI r3, 118
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
