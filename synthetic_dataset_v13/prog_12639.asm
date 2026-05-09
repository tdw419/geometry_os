; DESCRIPTION: Creates a purple rectangular region at (261, 6) spanning 75 by 81 pixels.
; PLAN: r0=261(x), r1=6(y), r2=75(width), r3=81(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 261
LDI r1, 6
LDI r2, 75
LDI r3, 81
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
