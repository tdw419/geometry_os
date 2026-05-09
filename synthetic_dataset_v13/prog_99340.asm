; DESCRIPTION: Creates a purple rectangular region at (149, 153) spanning 85 by 67 pixels.
; PLAN: r0=149(x), r1=153(y), r2=85(width), r3=67(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 153
LDI r2, 85
LDI r3, 67
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
