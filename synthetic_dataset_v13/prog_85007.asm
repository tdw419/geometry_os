; DESCRIPTION: Creates a blue rectangular region at (60, 39) spanning 118 by 115 pixels.
; PLAN: r0=60(x), r1=39(y), r2=118(width), r3=115(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 39
LDI r2, 118
LDI r3, 115
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
