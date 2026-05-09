; DESCRIPTION: Creates a purple rectangular region at (431, 178) spanning 74 by 11 pixels.
; PLAN: r0=431(x), r1=178(y), r2=74(width), r3=11(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 431
LDI r1, 178
LDI r2, 74
LDI r3, 11
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
