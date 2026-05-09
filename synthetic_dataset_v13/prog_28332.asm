; DESCRIPTION: Creates a blue rectangular region at (226, 30) spanning 100 by 110 pixels.
; PLAN: r0=226(x), r1=30(y), r2=100(width), r3=110(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 30
LDI r2, 100
LDI r3, 110
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
