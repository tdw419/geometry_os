; DESCRIPTION: Creates a blue rectangular region at (384, 162) spanning 67 by 79 pixels.
; PLAN: r0=384(x), r1=162(y), r2=67(width), r3=79(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 384
LDI r1, 162
LDI r2, 67
LDI r3, 79
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
