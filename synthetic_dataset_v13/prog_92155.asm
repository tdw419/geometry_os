; DESCRIPTION: Creates a blue rectangular region at (71, 96) spanning 89 by 112 pixels.
; PLAN: r0=71(x), r1=96(y), r2=89(width), r3=112(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 96
LDI r2, 89
LDI r3, 112
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
