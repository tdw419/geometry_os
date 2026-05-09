; DESCRIPTION: Creates a purple rectangular region at (103, 148) spanning 58 by 78 pixels.
; PLAN: r0=103(x), r1=148(y), r2=58(width), r3=78(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 148
LDI r2, 58
LDI r3, 78
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
