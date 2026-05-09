; DESCRIPTION: Creates a blue rectangular region at (322, 48) spanning 95 by 22 pixels.
; PLAN: r0=322(x), r1=48(y), r2=95(width), r3=22(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 322
LDI r1, 48
LDI r2, 95
LDI r3, 22
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
