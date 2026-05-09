; DESCRIPTION: Creates a purple rectangular region at (428, 40) spanning 65 by 114 pixels.
; PLAN: r0=428(x), r1=40(y), r2=65(width), r3=114(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 428
LDI r1, 40
LDI r2, 65
LDI r3, 114
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
