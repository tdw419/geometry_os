; DESCRIPTION: Creates a purple rectangular region at (138, 7) spanning 111 by 69 pixels.
; PLAN: r0=138(x), r1=7(y), r2=111(width), r3=69(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 7
LDI r2, 111
LDI r3, 69
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
