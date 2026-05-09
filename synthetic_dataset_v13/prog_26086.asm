; DESCRIPTION: Creates a blue rectangular region at (167, 105) spanning 92 by 77 pixels.
; PLAN: r0=167(x), r1=105(y), r2=92(width), r3=77(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 105
LDI r2, 92
LDI r3, 77
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
