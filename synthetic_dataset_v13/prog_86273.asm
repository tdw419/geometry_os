; DESCRIPTION: Creates a yellow rectangular region at (26, 135) spanning 117 by 11 pixels.
; PLAN: r0=26(x), r1=135(y), r2=117(width), r3=11(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 135
LDI r2, 117
LDI r3, 11
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
