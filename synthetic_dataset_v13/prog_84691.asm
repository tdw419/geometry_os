; DESCRIPTION: Creates a purple rectangular region at (185, 175) spanning 97 by 67 pixels.
; PLAN: r0=185(x), r1=175(y), r2=97(width), r3=67(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 175
LDI r2, 97
LDI r3, 67
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
