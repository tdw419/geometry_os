; DESCRIPTION: Creates a purple rectangular region at (468, 148) spanning 39 by 22 pixels.
; PLAN: r0=468(x), r1=148(y), r2=39(width), r3=22(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 468
LDI r1, 148
LDI r2, 39
LDI r3, 22
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
