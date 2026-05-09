; DESCRIPTION: Creates a blue rectangular region at (356, 88) spanning 37 by 90 pixels.
; PLAN: r0=356(x), r1=88(y), r2=37(width), r3=90(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 356
LDI r1, 88
LDI r2, 37
LDI r3, 90
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
