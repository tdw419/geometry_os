; DESCRIPTION: Creates a blue rectangular region at (311, 98) spanning 90 by 64 pixels.
; PLAN: r0=311(x), r1=98(y), r2=90(width), r3=64(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 311
LDI r1, 98
LDI r2, 90
LDI r3, 64
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
