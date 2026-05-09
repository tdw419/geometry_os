; DESCRIPTION: Creates a purple rectangular region at (114, 124) spanning 117 by 83 pixels.
; PLAN: r0=114(x), r1=124(y), r2=117(width), r3=83(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 124
LDI r2, 117
LDI r3, 83
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
