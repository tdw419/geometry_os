; DESCRIPTION: Creates a purple rectangular region at (110, 188) spanning 28 by 67 pixels.
; PLAN: r0=110(x), r1=188(y), r2=28(width), r3=67(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 188
LDI r2, 28
LDI r3, 67
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
