; DESCRIPTION: Creates a purple rectangular region at (210, 161) spanning 18 by 15 pixels.
; PLAN: r0=210(x), r1=161(y), r2=18(width), r3=15(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 161
LDI r2, 18
LDI r3, 15
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
