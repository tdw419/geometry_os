; DESCRIPTION: Creates a purple rectangular region at (86, 124) spanning 56 by 96 pixels.
; PLAN: r0=86(x), r1=124(y), r2=56(width), r3=96(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 124
LDI r2, 56
LDI r3, 96
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
