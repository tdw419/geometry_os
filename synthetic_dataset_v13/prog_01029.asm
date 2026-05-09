; DESCRIPTION: Creates a blue rectangular region at (397, 126) spanning 96 by 67 pixels.
; PLAN: r0=397(x), r1=126(y), r2=96(width), r3=67(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 397
LDI r1, 126
LDI r2, 96
LDI r3, 67
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
