; DESCRIPTION: Creates a blue rectangular region at (77, 6) spanning 73 by 82 pixels.
; PLAN: r0=77(x), r1=6(y), r2=73(width), r3=82(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 6
LDI r2, 73
LDI r3, 82
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
