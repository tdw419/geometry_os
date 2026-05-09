; DESCRIPTION: Creates a purple rectangular region at (411, 6) spanning 101 by 24 pixels.
; PLAN: r0=411(x), r1=6(y), r2=101(width), r3=24(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 411
LDI r1, 6
LDI r2, 101
LDI r3, 24
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
