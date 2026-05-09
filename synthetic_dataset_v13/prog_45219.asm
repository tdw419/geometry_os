; DESCRIPTION: Creates a blue rectangular region at (124, 64) spanning 34 by 29 pixels.
; PLAN: r0=124(x), r1=64(y), r2=34(width), r3=29(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 64
LDI r2, 34
LDI r3, 29
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
