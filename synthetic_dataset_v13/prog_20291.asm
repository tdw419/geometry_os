; DESCRIPTION: Creates a purple rectangular region at (326, 102) spanning 104 by 25 pixels.
; PLAN: r0=326(x), r1=102(y), r2=104(width), r3=25(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 326
LDI r1, 102
LDI r2, 104
LDI r3, 25
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
