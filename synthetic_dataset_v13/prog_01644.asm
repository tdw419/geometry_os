; DESCRIPTION: Creates a purple rectangular region at (162, 171) spanning 101 by 45 pixels.
; PLAN: r0=162(x), r1=171(y), r2=101(width), r3=45(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 171
LDI r2, 101
LDI r3, 45
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
