; DESCRIPTION: Creates a yellow rectangular region at (84, 67) spanning 81 by 60 pixels.
; PLAN: r0=84(x), r1=67(y), r2=81(width), r3=60(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 67
LDI r2, 81
LDI r3, 60
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
