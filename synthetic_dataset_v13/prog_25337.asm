; DESCRIPTION: Creates a purple rectangular region at (330, 153) spanning 25 by 53 pixels.
; PLAN: r0=330(x), r1=153(y), r2=25(width), r3=53(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 330
LDI r1, 153
LDI r2, 25
LDI r3, 53
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
