; DESCRIPTION: Creates a blue rectangular region at (371, 192) spanning 73 by 26 pixels.
; PLAN: r0=371(x), r1=192(y), r2=73(width), r3=26(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 371
LDI r1, 192
LDI r2, 73
LDI r3, 26
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
