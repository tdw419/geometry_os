; DESCRIPTION: Creates a blue rectangular region at (40, 119) spanning 32 by 58 pixels.
; PLAN: r0=40(x), r1=119(y), r2=32(width), r3=58(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 119
LDI r2, 32
LDI r3, 58
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
