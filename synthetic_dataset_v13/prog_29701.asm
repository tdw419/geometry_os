; DESCRIPTION: Creates a blue rectangular region at (12, 158) spanning 32 by 61 pixels.
; PLAN: r0=12(x), r1=158(y), r2=32(width), r3=61(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 158
LDI r2, 32
LDI r3, 61
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
