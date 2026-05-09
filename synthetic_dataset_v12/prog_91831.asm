; DESCRIPTION: Creates a blue rectangular region at (135, 75) spanning 94 by 81 pixels.
; PLAN: r0=135(x), r1=75(y), r2=94(width), r3=81(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 75
LDI r2, 94
LDI r3, 81
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
