; DESCRIPTION: Creates a blue rectangular region at (256, 25) spanning 49 by 89 pixels.
; PLAN: r0=256(x), r1=25(y), r2=49(width), r3=89(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 256
LDI r1, 25
LDI r2, 49
LDI r3, 89
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
