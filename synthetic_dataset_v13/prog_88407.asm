; DESCRIPTION: Creates a purple rectangular region at (183, 181) spanning 25 by 57 pixels.
; PLAN: r0=183(x), r1=181(y), r2=25(width), r3=57(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 181
LDI r2, 25
LDI r3, 57
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
