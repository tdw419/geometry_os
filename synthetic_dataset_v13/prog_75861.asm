; DESCRIPTION: Creates a purple rectangular region at (313, 56) spanning 23 by 56 pixels.
; PLAN: r0=313(x), r1=56(y), r2=23(width), r3=56(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 313
LDI r1, 56
LDI r2, 23
LDI r3, 56
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
