; DESCRIPTION: Creates a purple rectangular region at (64, 167) spanning 80 by 67 pixels.
; PLAN: r0=64(x), r1=167(y), r2=80(width), r3=67(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 167
LDI r2, 80
LDI r3, 67
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
