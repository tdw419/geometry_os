; DESCRIPTION: Creates a purple rectangular region at (250, 167) spanning 53 by 25 pixels.
; PLAN: r0=250(x), r1=167(y), r2=53(width), r3=25(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 167
LDI r2, 53
LDI r3, 25
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
