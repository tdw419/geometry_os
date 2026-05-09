; DESCRIPTION: Creates a purple rectangular region at (23, 55) spanning 46 by 88 pixels.
; PLAN: r0=23(x), r1=55(y), r2=46(width), r3=88(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 55
LDI r2, 46
LDI r3, 88
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
