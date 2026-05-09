; DESCRIPTION: Creates a blue rectangular region at (371, 86) spanning 45 by 81 pixels.
; PLAN: r0=371(x), r1=86(y), r2=45(width), r3=81(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 371
LDI r1, 86
LDI r2, 45
LDI r3, 81
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
