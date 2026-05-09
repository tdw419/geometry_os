; DESCRIPTION: Creates a purple rectangular region at (85, 84) spanning 91 by 36 pixels.
; PLAN: r0=85(x), r1=84(y), r2=91(width), r3=36(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 84
LDI r2, 91
LDI r3, 36
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
