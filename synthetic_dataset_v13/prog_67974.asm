; DESCRIPTION: Creates a purple rectangular region at (318, 40) spanning 13 by 67 pixels.
; PLAN: r0=318(x), r1=40(y), r2=13(width), r3=67(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 318
LDI r1, 40
LDI r2, 13
LDI r3, 67
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
