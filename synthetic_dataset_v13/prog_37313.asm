; DESCRIPTION: Creates a purple rectangular region at (411, 55) spanning 11 by 100 pixels.
; PLAN: r0=411(x), r1=55(y), r2=11(width), r3=100(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 411
LDI r1, 55
LDI r2, 11
LDI r3, 100
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
