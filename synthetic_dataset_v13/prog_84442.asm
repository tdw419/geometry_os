; DESCRIPTION: Creates a blue rectangular region at (54, 92) spanning 73 by 60 pixels.
; PLAN: r0=54(x), r1=92(y), r2=73(width), r3=60(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 92
LDI r2, 73
LDI r3, 60
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
