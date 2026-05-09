; DESCRIPTION: Creates a blue rectangular region at (176, 118) spanning 93 by 31 pixels.
; PLAN: r0=176(x), r1=118(y), r2=93(width), r3=31(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 118
LDI r2, 93
LDI r3, 31
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
