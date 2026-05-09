; DESCRIPTION: Creates a blue rectangular region at (158, 94) spanning 90 by 12 pixels.
; PLAN: r0=158(x), r1=94(y), r2=90(width), r3=12(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 94
LDI r2, 90
LDI r3, 12
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
