; DESCRIPTION: Creates a purple rectangular region at (307, 124) spanning 38 by 11 pixels.
; PLAN: r0=307(x), r1=124(y), r2=38(width), r3=11(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 307
LDI r1, 124
LDI r2, 38
LDI r3, 11
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
