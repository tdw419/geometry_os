; DESCRIPTION: Creates a purple rectangular region at (313, 89) spanning 48 by 114 pixels.
; PLAN: r0=313(x), r1=89(y), r2=48(width), r3=114(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 313
LDI r1, 89
LDI r2, 48
LDI r3, 114
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
