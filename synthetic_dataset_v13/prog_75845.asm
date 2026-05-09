; DESCRIPTION: Creates a purple rectangular region at (163, 33) spanning 114 by 63 pixels.
; PLAN: r0=163(x), r1=33(y), r2=114(width), r3=63(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 33
LDI r2, 114
LDI r3, 63
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
