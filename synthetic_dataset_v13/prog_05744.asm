; DESCRIPTION: Creates a blue rectangular region at (94, 95) spanning 13 by 32 pixels.
; PLAN: r0=94(x), r1=95(y), r2=13(width), r3=32(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 95
LDI r2, 13
LDI r3, 32
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
