; DESCRIPTION: Creates a blue rectangular region at (89, 72) spanning 92 by 64 pixels.
; PLAN: r0=89(x), r1=72(y), r2=92(width), r3=64(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 72
LDI r2, 92
LDI r3, 64
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
