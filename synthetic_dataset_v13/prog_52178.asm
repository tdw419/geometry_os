; DESCRIPTION: Creates a blue rectangular region at (448, 4) spanning 55 by 49 pixels.
; PLAN: r0=448(x), r1=4(y), r2=55(width), r3=49(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 448
LDI r1, 4
LDI r2, 55
LDI r3, 49
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
