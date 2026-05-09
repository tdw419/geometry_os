; DESCRIPTION: Creates a blue rectangular region at (221, 118) spanning 101 by 39 pixels.
; PLAN: r0=221(x), r1=118(y), r2=101(width), r3=39(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 118
LDI r2, 101
LDI r3, 39
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
