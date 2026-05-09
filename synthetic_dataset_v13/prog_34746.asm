; DESCRIPTION: Creates a purple rectangular region at (366, 125) spanning 100 by 100 pixels.
; PLAN: r0=366(x), r1=125(y), r2=100(width), r3=100(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 366
LDI r1, 125
LDI r2, 100
LDI r3, 100
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
