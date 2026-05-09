; DESCRIPTION: Creates a purple rectangular region at (481, 161) spanning 18 by 69 pixels.
; PLAN: r0=481(x), r1=161(y), r2=18(width), r3=69(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 481
LDI r1, 161
LDI r2, 18
LDI r3, 69
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
