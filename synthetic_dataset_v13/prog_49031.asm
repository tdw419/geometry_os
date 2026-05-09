; DESCRIPTION: Creates a blue rectangular region at (334, 67) spanning 84 by 87 pixels.
; PLAN: r0=334(x), r1=67(y), r2=84(width), r3=87(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 67
LDI r2, 84
LDI r3, 87
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
