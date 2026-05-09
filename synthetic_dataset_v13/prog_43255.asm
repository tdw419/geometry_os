; DESCRIPTION: Creates a blue rectangular region at (448, 34) spanning 21 by 26 pixels.
; PLAN: r0=448(x), r1=34(y), r2=21(width), r3=26(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 448
LDI r1, 34
LDI r2, 21
LDI r3, 26
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
