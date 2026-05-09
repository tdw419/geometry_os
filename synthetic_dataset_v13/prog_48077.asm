; DESCRIPTION: Creates a purple rectangular region at (20, 126) spanning 55 by 35 pixels.
; PLAN: r0=20(x), r1=126(y), r2=55(width), r3=35(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 126
LDI r2, 55
LDI r3, 35
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
