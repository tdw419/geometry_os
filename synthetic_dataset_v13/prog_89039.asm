; DESCRIPTION: Creates a blue rectangular region at (94, 98) spanning 114 by 89 pixels.
; PLAN: r0=94(x), r1=98(y), r2=114(width), r3=89(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 98
LDI r2, 114
LDI r3, 89
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
