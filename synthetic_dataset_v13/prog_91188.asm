; DESCRIPTION: Creates a blue rectangular region at (263, 227) spanning 56 by 29 pixels.
; PLAN: r0=263(x), r1=227(y), r2=56(width), r3=29(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 263
LDI r1, 227
LDI r2, 56
LDI r3, 29
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
