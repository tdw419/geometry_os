; DESCRIPTION: Creates a blue rectangular region at (60, 81) spanning 57 by 18 pixels.
; PLAN: r0=60(x), r1=81(y), r2=57(width), r3=18(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 81
LDI r2, 57
LDI r3, 18
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
