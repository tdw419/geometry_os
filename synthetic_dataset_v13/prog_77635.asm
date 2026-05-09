; DESCRIPTION: Creates a purple rectangular region at (18, 117) spanning 117 by 43 pixels.
; PLAN: r0=18(x), r1=117(y), r2=117(width), r3=43(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 117
LDI r2, 117
LDI r3, 43
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
