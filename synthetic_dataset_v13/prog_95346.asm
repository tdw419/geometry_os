; DESCRIPTION: Creates a purple rectangular region at (326, 124) spanning 70 by 103 pixels.
; PLAN: r0=326(x), r1=124(y), r2=70(width), r3=103(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 326
LDI r1, 124
LDI r2, 70
LDI r3, 103
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
