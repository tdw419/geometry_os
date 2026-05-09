; DESCRIPTION: Creates a blue rectangular region at (77, 73) spanning 67 by 92 pixels.
; PLAN: r0=77(x), r1=73(y), r2=67(width), r3=92(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 73
LDI r2, 67
LDI r3, 92
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
