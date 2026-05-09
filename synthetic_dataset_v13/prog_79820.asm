; DESCRIPTION: Creates a purple rectangular region at (69, 85) spanning 74 by 56 pixels.
; PLAN: r0=69(x), r1=85(y), r2=74(width), r3=56(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 85
LDI r2, 74
LDI r3, 56
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
