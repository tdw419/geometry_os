; DESCRIPTION: Creates a purple rectangular region at (121, 148) spanning 20 by 50 pixels.
; PLAN: r0=121(x), r1=148(y), r2=20(width), r3=50(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 148
LDI r2, 20
LDI r3, 50
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
