; DESCRIPTION: Creates a blue rectangular region at (448, 108) spanning 32 by 118 pixels.
; PLAN: r0=448(x), r1=108(y), r2=32(width), r3=118(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 448
LDI r1, 108
LDI r2, 32
LDI r3, 118
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
