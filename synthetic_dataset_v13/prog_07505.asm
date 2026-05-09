; DESCRIPTION: Creates a purple rectangular region at (161, 111) spanning 69 by 80 pixels.
; PLAN: r0=161(x), r1=111(y), r2=69(width), r3=80(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 111
LDI r2, 69
LDI r3, 80
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
