; DESCRIPTION: Creates a blue rectangular region at (343, 81) spanning 112 by 12 pixels.
; PLAN: r0=343(x), r1=81(y), r2=112(width), r3=12(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 343
LDI r1, 81
LDI r2, 112
LDI r3, 12
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
