; DESCRIPTION: Creates a blue rectangular region at (246, 7) spanning 67 by 119 pixels.
; PLAN: r0=246(x), r1=7(y), r2=67(width), r3=119(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 7
LDI r2, 67
LDI r3, 119
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
