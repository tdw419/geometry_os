; DESCRIPTION: Creates a purple rectangular region at (15, 3) spanning 117 by 46 pixels.
; PLAN: r0=15(x), r1=3(y), r2=117(width), r3=46(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 3
LDI r2, 117
LDI r3, 46
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
