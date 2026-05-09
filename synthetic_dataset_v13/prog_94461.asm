; DESCRIPTION: Creates a purple rectangular region at (19, 55) spanning 13 by 68 pixels.
; PLAN: r0=19(x), r1=55(y), r2=13(width), r3=68(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 55
LDI r2, 13
LDI r3, 68
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
