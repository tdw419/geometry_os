; DESCRIPTION: Creates a blue rectangular region at (250, 84) spanning 92 by 48 pixels.
; PLAN: r0=250(x), r1=84(y), r2=92(width), r3=48(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 84
LDI r2, 92
LDI r3, 48
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
