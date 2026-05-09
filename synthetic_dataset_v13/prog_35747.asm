; DESCRIPTION: Creates a blue rectangular region at (219, 1) spanning 48 by 58 pixels.
; PLAN: r0=219(x), r1=1(y), r2=48(width), r3=58(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 1
LDI r2, 48
LDI r3, 58
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
