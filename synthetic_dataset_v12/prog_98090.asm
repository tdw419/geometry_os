; DESCRIPTION: Creates a yellow rectangular region at (501, 135) spanning 11 by 45 pixels.
; PLAN: r0=501(x), r1=135(y), r2=11(width), r3=45(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 501
LDI r1, 135
LDI r2, 11
LDI r3, 45
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
