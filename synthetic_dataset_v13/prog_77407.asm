; DESCRIPTION: Creates a blue rectangular region at (14, 66) spanning 56 by 111 pixels.
; PLAN: r0=14(x), r1=66(y), r2=56(width), r3=111(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 66
LDI r2, 56
LDI r3, 111
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
