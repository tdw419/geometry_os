; DESCRIPTION: Creates a blue rectangular region at (231, 16) spanning 67 by 96 pixels.
; PLAN: r0=231(x), r1=16(y), r2=67(width), r3=96(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 16
LDI r2, 67
LDI r3, 96
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
