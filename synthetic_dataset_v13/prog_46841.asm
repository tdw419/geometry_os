; DESCRIPTION: Creates a purple rectangular region at (426, 65) spanning 15 by 70 pixels.
; PLAN: r0=426(x), r1=65(y), r2=15(width), r3=70(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 426
LDI r1, 65
LDI r2, 15
LDI r3, 70
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
