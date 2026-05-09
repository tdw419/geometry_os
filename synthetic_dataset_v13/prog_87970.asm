; DESCRIPTION: Creates a blue rectangular region at (440, 106) spanning 36 by 94 pixels.
; PLAN: r0=440(x), r1=106(y), r2=36(width), r3=94(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 440
LDI r1, 106
LDI r2, 36
LDI r3, 94
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
